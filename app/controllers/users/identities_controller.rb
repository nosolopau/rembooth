class Users::IdentitiesController < ApplicationController
  def twitter
    current_user.add_twitter_account(request.env['omniauth.auth'])

    redirect_to root_path
  end
end