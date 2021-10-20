class AddShopIdToBeans < ActiveRecord::Migration[6.1]
  def change
    add_reference :beans, :shop, foreign_key: true
  end
end
