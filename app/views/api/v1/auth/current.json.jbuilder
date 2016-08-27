json.set! :user do
  json.extract! @user, :provider, :uid, :first_name, :last_name, :username, :link, :image, :email, :name
end
