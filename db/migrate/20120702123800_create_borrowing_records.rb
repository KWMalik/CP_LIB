class CreateBorrowingRecords < ActiveRecord::Migration
  def change
    create_table :borrowing_records do |t|
      t.integer :reader_id
      t.integer :book_id
      t.boolean :current, default: true

      t.timestamps
    end

    add_index :borrowing_records, :reader_id
    add_index :borrowing_records, :book_id
    add_index :borrowing_records, :current
  end
end
