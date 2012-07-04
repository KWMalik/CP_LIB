class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :sn

      t.timestamps
    end

    add_index :books, :sn, unique: true
    add_index :books, :name
  end
end
