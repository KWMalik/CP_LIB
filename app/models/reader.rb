class Reader < ActiveRecord::Base
  attr_accessible :employee_id, :name

  validates :employee_id, presence: true
  validates :name, presence: true

  has_many :borrowing_records, dependent: :destroy
  has_many :books, :through => :borrowing_records
end
