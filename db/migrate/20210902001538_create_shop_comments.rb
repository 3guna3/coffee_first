class CreateShopComments < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_comments do |t|
      t.text :content, null: false
      t.float :rate, null: false

      t.timestamps
    end
  end
end
