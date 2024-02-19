ActiveAdmin.register FoodItem do
  remove_filter :order_items ,:picture
  # remove_filter :pictures

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :food_type, :price , :restaurant_id, :category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :type, :restaurant_id, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  form do |f|
    f.inputs "Food Item Details" do
      f.input :restaurant, as: :select, collection: Restaurant.all.map { |r| [r.name, r.id] }, selected: params[:restaurant_id]
      f.input :category, as: :select, collection: Category.all
      f.input :food_type, as: :select, collection: ['Veg', 'Non-veg', 'Beverage','Dessert'] 
      f.input :name
      f.input :description
      f.input :price
    end
    f.actions
  end 
  
end
