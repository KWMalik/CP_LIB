class BorrowingRecordsController < ApplicationController
  include BorrowingRecordsHelper
  before_filter :signed_in?

  def create
    book = Book.find_by_sn params[:sn]
    reader = Reader.find_by_employee_id params[:employee_id]
    if valid_borrow_condition? book, reader
      book.borrowing_records.create(reader_id: reader.id)
      flash[:success] = "Borrow successfully!"
      redirect_to root_path
    end
  end

  def update
    BorrowingRecord.find(params[:id]).toggle!(:current)
    flash[:success] = "Book returned successfully!"
    redirect_to root_path
  end
end
