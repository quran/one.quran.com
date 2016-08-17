module Api
  module V1
    class OauthController < ApplicationController
      def create
        @user = User.from_omniauth(env['omniauth.auth'])
      end
    end
  end
end
