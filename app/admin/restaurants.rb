ActiveAdmin.register Restaurant do
  remove_filter :food_items, :picture


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # app/admin/restaurant.rb
  
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
        # Create associated address using the provided values
        address_params = {
          door_number: params[:restaurant][:address][:door_number],
          street_area: params[:restaurant][:address][:street_area],
          city: params[:restaurant][:address][:city],
          state: params[:restaurant][:address][:state],
          zipcode: params[:restaurant][:address][:zipcode]
        } 
        @restaurant.create_address(address_params)
        redirect_to admin_restaurant_path(@restaurant)
      else
        render :new
      end
    end
  end
  
end
