class ChangeDishesFromTables < ActiveRecord::Migration[5.0]
  def up
    change_column :tables, :dishes, :text, array: true, default: []
  end

  def down
    change_column :tables, :dishes, :text
  end
end
