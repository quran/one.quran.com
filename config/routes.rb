Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'auth/create'
      get 'auth/current'
    end
  end

  get 'auth/:provider/callback', to: 'api/v1/auth#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
