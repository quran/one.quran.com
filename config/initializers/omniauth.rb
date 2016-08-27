Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV.fetch('FACEBOOK_APP_ID'), ENV.fetch('FACEBOOK_APP_SECRET'),
    scope: 'email,public_profile,user_location',
    info_fields: 'name,first_name,last_name,link,email'
end
