class Book < ActiveRecord::Base
  attr_accessible :name, :sn, :price, :press, :author

  validates :sn, presence: true
  validates :name, presence: true

  has_many :borrowing_records, dependent: :destroy
  has_many :readers, :through => :borrowing_records
end
