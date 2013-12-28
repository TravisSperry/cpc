namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
  end
end

def make_users
  admin = User.create!(first_name:            "Travis",
                       last_name:             "Sperry",
                       email:                 "travis@columbuspowdercoat.com",
                       password:              "password",
                       password_confirmation: "password")
  admin.toggle!(:admin)

  admin1 = User.create!(first_name:           "Paul",
                        last_name:            "Doucher",
                        suffix:               "II",
                        email:                "paul@columbuspowdercoat.com",
                        password:             "password",
                        password_confirmation:"password")

  admin1.toggle!(:admin)

  admin2 = User.create!(first_name:           "Paul",
                        last_name:            "Doucher",
                        email:                "pauld@columbuspowdercoat.com",
                        password:             "password",
                        password_confirmation:"password")

  admin2.toggle!(:admin)
end
