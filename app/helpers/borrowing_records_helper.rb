module BorrowingRecordsHelper
  def valid_borrow_condition? book, reader
    if book.nil?
      flash[:error] = "Wrong book sn, please check!"
      redirect_to root_path
    elsif reader.nil?
      flash[:error] = "Unregistered reader, please check or register first!"
      redirect_to root_path
    elsif !book.borrowing_records.find_by_current(true).nil?
      flash[:error] = "\"#{book.name}\" was not on shelf, please check!"
      redirect_to root_path
    elsif reader.borrowing_records.find_all_by_current(true).size >=2
      flash[:error] = "\"#{reader.name}\" has borrowed 2 books, can not borrow any more!"
      redirect_to root_path
    else
      return true
    end
    false
  end
end
