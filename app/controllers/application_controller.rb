class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate
  before_action :set_default_response_format

  helper_method :current_user

  def current_user # rubocop:disable Style/TrivialAccessors
    @current_user
  end

protected

  def authenticate
    decoded_token = JWT.decode(authentication_token, Rails.application.secrets.secret_key_base).first
    @current_user ||= User.find(decoded_token['id'])

  rescue JWT::DecodeError
    render json: { error: 'unauthorized' }, status: :unauthorized
  end

  def authentication_token
    %r{Bearer (.*)}.match(request.headers['Authorization']).try(:captures).try(:first)
  end

  def set_default_response_format
    request.format = :json
  end
end
