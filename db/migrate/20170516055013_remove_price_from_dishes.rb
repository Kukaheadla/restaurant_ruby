class RemovePriceFromDishes < ActiveRecord::Migration[5.0]
  def change
    remove_column :dishes, :price, :decimal
  end
end
