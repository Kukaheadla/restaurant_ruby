class RemoveDishFromTables < ActiveRecord::Migration[5.0]
  def change
    remove_column :tables, :dishes, :text
  end
end
