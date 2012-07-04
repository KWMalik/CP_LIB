class CreateReaders < ActiveRecord::Migration
  def change
    create_table :readers do |t|
      t.string :name
      t.string :employee_id

      t.timestamps
    end

    add_index :readers, :employee_id, unique: true
    add_index :readers, :name
  end
end
