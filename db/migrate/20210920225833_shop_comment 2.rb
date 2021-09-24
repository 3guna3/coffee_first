class ShopComment < ActiveRecord::Migration[6.1]
  def change
    drop_table :shop_comments
  end
end
