ActiveAdmin.register Restaurant do
  remove_filter :food_items, :picture

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # app/admin/restaurant.rb
 
  index do
    selectable_column
    column :id
    column :name
    column :spaciality
    column :area
    column :updated_at
    actions defaults: true do |resource|
      link_to "Add Dish", new_admin_food_item_path(restaurant_id: resource.id), method: :get
    end
  end

  permit_params :name, :spaciality, :area,
                address_attributes: [:id, :door_number, :street_area, :city, :state, :zip_code]

  form do |f|
    f.inputs 'Restaurant Details' do
      f.input :name
      f.input :spaciality
      f.input :area
    end

    f.inputs 'Address Details' do
      f.semantic_fields_for :address, (f.object.address || f.object.build_address) do |address|
        address.input :door_number
        address.input :street_area
        address.input :city
        address.input :state
        address.input :zipcode
      end
    end

    f.actions
  end
   
  controller do
    def create
      @restaurant = Restaurant.new(permitted_params[:restaurant])
      if @restaurant.save
        address_attributes= params[:restaurant][:address]
        address_params = {
          door_number: address_attributes[:door_number],
          street_area: address_attributes[:street_area],
          city: address_attributes[:city],
          state: address_attributes[:state],
          zipcode: address_attributes[:zipcode]
        } 
        @restaurant.create_address(address_params)
        redirect_to admin_restaurant_path(@restaurant)
      else
        render :new
      end
    end
  end
  
end
