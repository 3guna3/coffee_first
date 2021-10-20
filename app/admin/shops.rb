ActiveAdmin.register Shop do
  permit_params :name, :prefecture, :address, :TEL, :URL, :img, :user_id
  index do
    selectable_column

    id_column
    column :name
    column :prefecture
    column :address
    column :rate_average
    column :user
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
