ActiveAdmin.register Restaurant do
  remove_filter :food_items, :picture


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :spaciality, :area
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :spaciality, :area]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
