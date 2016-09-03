FactoryGirl.define do
  factory :bookmark do
    ayah_key '1:1'

    association :user, factory: :user
  end
end
