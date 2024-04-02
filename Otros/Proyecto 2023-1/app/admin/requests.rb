ActiveAdmin.register Request do
    permit_params :user_id, :product_id
  
    index do
      selectable_column
      id_column
      column :user
      column :product
      column :created_at
      actions
    end
  
    filter :user
    filter :product
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :user
        f.input :product
      end
      f.actions
    end
  end
  