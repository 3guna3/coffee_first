class RenamePrefactureColumnToShops < ActiveRecord::Migration[6.1]
  def change
    rename_column :shops, :prefacture, :prefecture
  end
end
