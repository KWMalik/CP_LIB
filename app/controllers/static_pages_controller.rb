class StaticPagesController < ApplicationController
  def home
    @borrowing_records = BorrowingRecord.from_current_not_returned.paginate(page: params[:page])
  end

  def help
  end

  def about
  end

  def contact
  end
end
