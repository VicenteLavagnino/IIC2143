ActiveAdmin.register Product do
    permit_params :name, :description, :price
    
    index do
      selectable_column
      id_column
      column :name
      column :price
      actions
    end
  
    show do
      attributes_table do
        row :name
        row :description
        row :price
      end
    end
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :description
        f.input :price
      end
      f.actions
    end
end
  