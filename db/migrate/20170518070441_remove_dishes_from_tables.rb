class RemoveDishesFromTables < ActiveRecord::Migration[5.0]
  def change
    remove_column :tables, :dishes, :array
  end
end
