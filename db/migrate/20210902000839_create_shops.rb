class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.integer :prefacture, null: false
      t.string :address, null: false
      t.string :TEL
      t.text :URL
      t.string :img

      t.timestamps
    end
  end
end
