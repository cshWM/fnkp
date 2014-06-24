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

    CoachCategory.create!( name: "Grau 1",
                            order: 1,
                            active: true)
    CoachCategory.create!( name: "Grau 2",
                            order: 2,
                            active: true)
    CoachCategory.create!( name: "Grau 3",
                            order: 3,
                            active: true)
    CoachCategory.create!( name: "Grau 4",
                            order: 4,
                            active: true)

  end

end
