FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    tipo      1
    password "foobar"
    password_confirmation "foobar"
  end
end
