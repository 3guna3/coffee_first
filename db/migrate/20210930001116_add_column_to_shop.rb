class AddColumnToShop < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :rate_average, :float, default: 0.0
  end
end
