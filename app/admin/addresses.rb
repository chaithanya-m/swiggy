ActiveAdmin.register Address do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :addressable_type, :addressable_id, :door_number, :street_area, :city, :state, :zipcode
  #
  # or
  #
  # permit_params do
  #   permitted = [:addressable_type, :addressable_id, :door_number, :street_area, :city, :state, :zipcode]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :door_number, :street_area, :city, :state, :zipcode, :addressable_type, :addressable_id
  
    form do |f|
      f.inputs 'Address Details' do
        f.input :door_number
        f.input :street_area
        f.input :city
        f.input :state
        f.input :zipcode
        f.input :addressable_type, as: :select, collection: ['User', 'Restaurant']
        f.input :addressable_id, label: 'Addressable ID' # Set the label to 'Addressable ID'
        end
      f.actions
    end
  
end
