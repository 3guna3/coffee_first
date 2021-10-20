ActiveAdmin.register Bean do
  permit_params :name, :price, :country, :farm, :variety, :screen_size, :img, :user_id, :shop

  index do
    selectable_column

    id_column
    column :name
    column :price
    column :country
    column :user
    column :shop
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :price
  filter :country
  filter :created_at

  show do |bean|
    attributes_table(*bean.class.columns.collect { |column| column.name.to_sym })
    panel "コメント一覧" do
      table_for bean.beans_comments do
        column :user
        column :content
        column :created_at
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :country
      f.input :farm
      f.input :variety
      f.input :screen_size
      f.input :img
    end
    f.actions
  end
end
