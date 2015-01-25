class User
  include Mongoid::Document

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:redbooth]

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

  def self.from_redbooth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
      user.extra = auth.extra
      user.credentials = auth.credentials
    end
  end

  def update_from_omniauth(auth)
    update_attributes(email: auth.info.email, credentials: auth.credentials, extra: auth.extra)
  end
end
