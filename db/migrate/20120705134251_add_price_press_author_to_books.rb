class AddPricePressAuthorToBooks < ActiveRecord::Migration
  def change
    add_column :books, :price, :float
    add_column :books, :press, :string
    add_column :books, :author, :string
  end
end
