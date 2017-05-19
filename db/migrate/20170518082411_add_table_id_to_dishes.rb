class AddTableIdToDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :table_id, :integer
    add_column :dishes, :quantity, :integer
  end
end
