namespace :db do
  desc "Fill database with initial data"
  task populate: :environment do
    make_users
    make_books
    make_readers
    make_borrowing_records
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

def make_borrowing_records
  40.times do |n|
    BorrowingRecord.create!(reader_id: n+1,
                            book_id: n+1)
  end
  two_months_record = BorrowingRecord.first
  two_months_record.created_at=2.months.ago
  three_months_record = BorrowingRecord.find(2)
  three_months_record.created_at=3.months.ago
  two_months_record.save
  three_months_record.save
end
