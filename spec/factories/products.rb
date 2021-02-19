FactoryGirl.define do
  factory :product do
    name "MyString"
    pricing 100
    description "MyText"
    association :user, factory: :user
  end
end
