require 'rails_helper'

RSpec.describe 'Api::V1::Auth', type: :request do
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

  describe 'GET /api/v1/auth/current' do
    it 'returns unauthorized when calling with no token' do
      get api_v1_auth_current_path
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns unauthorized with invalud token' do
      get api_v1_auth_current_path, headers: { 'Authorization' => 'NOT_VALID' }
      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns success when token is valid with the user' do
      get api_v1_auth_current_path, headers: { 'Authorization' => "Bearer #{jwt}" }
      expect(response).to have_http_status(:success)
      expect(response_json['user'].sort.to_h).to eql(user.as_json.except('id', 'created_at', 'updated_at', 'oauth_token', 'oauth_expires_at').sort.to_h)
    end
  end
end
