FactoryGirl.define do
  factory :note do
    ayah_key '1:1'
    text 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do.'

    association :user, factory: :user
  end

end
