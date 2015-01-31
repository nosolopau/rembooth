class User
  include Mongoid::Document
  include Mongoid::Timestamps

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:redbooth]

  has_many :reminders

  ## Database authenticatable
  field :email, type: String, default: ''
  field :encrypted_password, type: String, default: ''

  ## Recoverable
  field :reset_password_token, type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count, type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at, type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip, type: String

  # Other fields
  field :uid, type: String
  field :provider, type: String
  field :name, type: String
  field :credentials, type: Hash
  field :extra, type: Hash

  field :twitter_nickname, type: String
  field :twitter_info, type: Hash
  field :twitter_credentials, type: Hash

  def self.find_or_create_from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.from_redbooth(auth)
      user.create_password
    end
  end

  def add_twitter_account(auth)
    self.twitter_nickname = auth['info']['nickname']
    self.twitter_credentials = auth['credentials']
    self.twitter_info = auth['info']
    save!
  end

  def update_from_omniauth(auth)
    from_redbooth(auth)
    save!
  end

  def from_redbooth(auth)
    self.email = auth.info.email
    self.name = auth.info.name
    self.extra = auth.extra
    self.credentials = auth.credentials
  end

  def create_password
    self.password = Devise.friendly_token[0,20]
  end

  def refresh_token_if_expired
    refresh_token! if token_expired?
  end

  def refresh_token!
    self.credentials = RedboothService::Auth.refresh_token(credentials)
    save!
  end

  def token_expired?
    credentials[:expires] && (Time.now > Time.strptime(credentials[:expires_at].to_s, '%s'))
  end

  def linked_twitter_account?
    twitter_nickname.present?
  end
end
