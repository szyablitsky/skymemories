FactoryGirl.define do
  factory :user do
    name 'Smith'
    email 'test@test.com'
    password 'foobar'
    password_confirmation 'foobar'
  end
end
