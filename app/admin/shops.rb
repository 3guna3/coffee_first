ActiveAdmin.register Shop do
  permit_params :name, :prefecture, :address, :TEL, :URL, :img, :user_id
  index do
    selectable_column

    id_column
    column :name
    column :prefecture
    column :address
    column :rate_average
    column "登録者" do |shop|
      shop.user.name
    end
    column "登録コーヒー豆数" do |shop|
      shop.beans.count
    end
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :prefecture
  filter :address
  filter :rate_average
  filter :created_at

  show do |shop|
    attributes_table(*shop.class.columns.collect { |column| column.name.to_sym })
    panel "登録コーヒー豆一覧" do
      table_for shop.beans do
        column :name
        column :country
        column :price
        column :created_at
      end
    end
    panel "コメント一覧" do
      table_for shop.shop_comments do
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
      f.input :prefecture
      f.input :address
      f.input :TEL
      f.input :URL
      f.input :img
    end
    f.actions
  end
end
