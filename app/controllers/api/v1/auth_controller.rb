module Api
  module V1
    class AuthController < ApplicationController
      skip_before_action :authenticate, only: [:create]

      TOKEN_ALGORITHM = 'HS256'

      def create
        @user = User.from_omniauth(env['omniauth.auth'])
        @access_token = generate_token(@user.as_json)
      end

      def current
        @user = current_user
      end

    private

      def generate_token(user)
        token = token_payload(user)
        JWT.encode(token, Rails.application.secrets.secret_key_base, TOKEN_ALGORITHM)
      end

      def token_payload(user)
        now = Time.now.to_i
        {
          'iss' => 'onit',
          'exp' => token_expiration,
          'nbf' => now - 60,     # available for use 1 minute before now
          'iat' => now,          # time issued
          'jti' => SecureRandom.uuid,
          'id'  => user.id
        }
      end

      def token_expiration
        @token_expiration ||= Time.now.to_i + 86_400 # expires 1 day from now
      end
    end
  end
end
