class BeansComments < ActiveRecord::Migration[6.1]
  def change
    drop_table :beans_comments
  end
end
