ActiveAdmin.register Review do
    permit_params :rate, :comment, :user_id, :product_id
  
    index do
      selectable_column
      id_column
      column :user
      column :product
      column :rate
      column :comment
      column :created_at
      actions
    end
  
    filter :user
    filter :product
    filter :rate
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :user
        f.input :product
        f.input :rate
        f.input :comment
      end
      f.actions
    end
  end
  