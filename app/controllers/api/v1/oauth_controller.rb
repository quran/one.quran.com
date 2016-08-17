class Api::V1::OauthController < ApplicationController
  def create
    user = User.from_omniauth(env['omniauth.auth'])

    render json: user
  end
end
