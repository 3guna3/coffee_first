class CreateBeansComments < ActiveRecord::Migration[6.1]
  def change
    create_table :beans_comments do |t|
      t.text :content, null: false
      t.float :bitterness, null: false
      t.float :acidity, null: false
      t.float :body, null: false
      t.references :user, null: false, foreign_key: true
      t.references :bean, null: false, foreign_key: true

      t.timestamps
    end
  end
end
