require 'rails_helper'

RSpec.describe Api::V1::OauthController, type: :controller do

  describe 'GET #facebook' do
    it 'returns http success' do
      get :facebook
      expect(response).to have_http_status(:success)
    end
  end

end
