namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 tipo: 1,
                 password: "foobar",
                 password_confirmation: "foobar")
    20.times do |n|
      name  = Faker::Name.name
      email = "assoc-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   tipo: 2,
                   password: password,
                   password_confirmation: password)
    end
    60.times do |n|
      name  = Faker::Name.name
      email = "club-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   tipo: 3,
                   password: password,
                   password_confirmation: password)
    end

  end
end
