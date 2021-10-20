ActiveAdmin.register User do
  permit_params :name, :email, :password, :password_confirmation, :img, :self_introduction

  index do
    selectable_column

    id_column
    column :name
    column :created_at
    column :updated_at
    actions
  end

  filter :email
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
