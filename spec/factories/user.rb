FactoryGirl.define do
  sequence :email do |n|
    "foo#{n}@bar.com"
  end

  factory :user do
    email
    password 'foobar'
  end
end
