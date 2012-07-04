class BorrowingRecord < ActiveRecord::Base
  attr_accessible :current, :reader_id, :book_id

  validates :book_id, presence: true
  validates :reader_id, presence: true

  belongs_to :book
  belongs_to :reader

  private

  def self.from_current_not_returned
    where("current = :current_status", current_status: true)
  end
end
