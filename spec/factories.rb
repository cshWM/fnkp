FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    tipo 3
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      tipo 1
    end

    factory :association do
      tipo 2
    end

    factory :club do
      tipo 3
    end


  end
end
