ActiveAdmin.register BeansComment do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :content, :bitterness, :acidity, :body, :user_id, :bean_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:content, :bitterness, :acidity, :body, :user_id, :bean_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :content, :bitterness, :acidity, :body

  index do
    selectable_column

    id_column
    column :content
    column :bitterness
    column :acidity
    column :body
    column "登録者", :user
    column "コーヒー豆", :bean
    column :created_at
    column :updated_at
    actions
  end

  filter :user
  filter :bean
  filter :bitterness
  filter :acidity
  filter :body
  filter :created_at
end
