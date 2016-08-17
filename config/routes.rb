Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'oauth/facebook'
    end
  end

  get 'auth/:provider/callback', to: 'api/v1/oauth#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
