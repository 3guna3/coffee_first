class CreateBeans < ActiveRecord::Migration[6.1]
  def change
    create_table :beans do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :country, null: false
      t.string :farm
      t.string :variety
      t.integer :screen_size
      t.string :img

      t.timestamps
    end
  end
end
