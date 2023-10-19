ActiveAdmin.register FoodItem do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :price, :type, :restaurant_id, :category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :type, :restaurant_id, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs 'Food Item Details' do
      f.input :name
      f.input :description
      f.input :price
      f.input :type
      f.input :image, as: :file
    end
    f.actions
  end
  
end
