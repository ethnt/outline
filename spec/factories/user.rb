FactoryGirl.define do
  sequence :email do |n|
    "nei;#{n}@tyson.com"
  end

  factory :user do
    email
    password 'foobar'
  end
end
