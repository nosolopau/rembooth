class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :authenticate_user!
  
  def redbooth
    @user = User.find_or_create_from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      @user.update_from_omniauth(request.env['omniauth.auth']) unless @user.new_record?

      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.redbooth_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
