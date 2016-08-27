require 'rails_helper'

RSpec.describe Api::V1::AuthController, type: :controller do
  let(:algorithm) { 'HS256' }
  let(:user) { create(:user) }
  let(:token_payload) do
    now = Time.now.to_i
    {
      'iss' => 'onit',
      'exp' => token_expiration,
      'nbf' => now - 60,     # available for use 1 minute before now
      'iat' => now,          # time issued
      'jti' => SecureRandom.uuid,
      'sub' => user.email
    }.merge(user.as_json)
  end

  let(:token_expiration) { Time.now.to_i + 86_400 }

  let(:jwt) { JWT.encode(token_payload, Rails.application.secrets.secret_key_base, algorithm) }

  describe 'GET #current' do
    it 'returns unauthorized when calling with no token' do
      get :current
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns unauthorized with invalud token' do
      request.headers['Authorization'] = 'NOT_VALID'
      get :current
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns success when token is valid' do
      request.headers['Authorization'] = "Bearer #{jwt}"
      get :current
      expect(response).to have_http_status(:success)
    end
  end

end
