namespace :db do
  desc "Fill database with initial data"
  task populate: :environment do
    make_users
  end
end

def make_users
  admin = User.create!(name:     "caibaobao",
                       password: "cb560921",)
  admin.toggle!(:admin)
end
