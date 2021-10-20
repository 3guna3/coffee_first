ActiveAdmin.register User do
  permit_params :name, :email, :password, :password_confirmation, :self_introduction, :img

  index do
    selectable_column

    id_column
    column :name
    column "登録店舗数" do |user|
      user.shops.count
    end
    column "登録コーヒー豆数" do |user|
      user.beans.count
    end
    column :created_at
    column :updated_at
    actions
  end

  show do |user|
    attributes_table(*user.class.columns.collect { |column| column.name.to_sym })
    panel "登録店舗一覧" do
      table_for user.shops do
        column :name
        column :prefecture
        column :address
        column :created_at
      end
    end
    panel "登録コーヒー豆一覧" do
      table_for user.beans do
        column :name
        column :country
        column :price
        column :created_at
      end
    end
    active_admin_comments
  end

  filter :name
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :self_introduction
      f.input :img
    end
    f.actions
  end
end
