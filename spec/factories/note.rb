FactoryGirl.define do
  factory :note do
    title 'Foobar'
    text '**This is a note!**'

    user
  end
end
