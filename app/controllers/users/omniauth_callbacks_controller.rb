class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def redbooth
    @user = User.from_redbooth request.env['omniauth.auth']

    if @user.persisted?
      @user.update_from_omniauth(request.env["omniauth.auth"]) unless @user.new_record?

      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Redbooth') if is_navigational_format?
    else
      session['devise.redbooth_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end