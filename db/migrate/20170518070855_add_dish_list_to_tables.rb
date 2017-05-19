class AddDishListToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :tables, :dishes, :text, array:true 
  end
end
