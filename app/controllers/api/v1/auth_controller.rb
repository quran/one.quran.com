module Api
  module V1
    class AuthController < ApplicationController
      def create
        @user = User.from_omniauth(env['omniauth.auth'])
      end
    end
  end
end
