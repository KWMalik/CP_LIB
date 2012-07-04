namespace :db do
  desc "Fill database with initial data"
  task populate: :environment do
    make_users
    make_books
    make_readers
  end
end

def make_users
  admin = User.create!(name: "michellecai",
                       password: "cb560921",)
  admin.toggle!(:admin)
end

def make_books
  100.times do |n|
    name = Faker::Name.name
    sn = "ISBN-#{n}"
    Book.create!(name: name,
                 sn: sn)
  end
end

def make_readers
  50.times do |n|
    name = Faker::Name.name
    employee_id = (1000+n).to_s
    Reader.create!(name: name,
                   employee_id: employee_id)
  end
end
