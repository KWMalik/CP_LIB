class ReadersController < ApplicationController
  before_filter :signed_in?

  def index
    @readers = Reader.paginate(page: params[:page])
  end

  def destroy
    reader=Reader.find(params[:id])
    if reader.borrowing_records.find_by_current(true).nil?
      reader.destroy
      flash[:success] = "Reader unregistered!"
      redirect_to readers_path
    else
      flash[:error] = "Reader \"#{reader.name}\" still borrows some books, return it first!"
      redirect_to root_path
    end
  end

  def show
    @reader = Reader.find(params[:id])
  end

  def new
    @reader = Reader.new
  end

  def create
    @reader = Reader.new(params[:reader])
    if @reader.save
      flash[:success] = "Add Reader \"#{@reader.name}\"!"
      redirect_to readers_path
    else
      render 'new'
    end
  end

  def edit
    @reader = Reader.find(params[:id])
  end

  def update
    @reader = Reader.find(params[:id])
    if @reader.update_attributes(params[:reader])
      flash[:success] = "Profile updated!"
      redirect_to @reader
    else
      render 'edit'
    end
  end
end
