class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :tables do |t|
      t.integer :table_no
      t.integer :user_id
      t.text :dish

      t.timestamps
    end
  end
end
