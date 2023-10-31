class AddressesController < ApplicationController
  def index
    @addresses= current_user.addresses
  end

  def new
    @address=current_user.addresses.new
  end
  def create
    @user = current_user  # Assuming you have a `current_user` method available
    @address = @user.addresses.new(address_params)

    if @address.save
      redirect_to user_addresses_path(current_user) , notice: 'Address was successfully created.'
    else
      render :new
    end
  end
  
  def edit 
    @user = current_user # Assuming you have a `current_user` method
    @address = @user.addresses.find(params[:id])
  end
  def update
    @user = current_user
    @address = @user.addresses.find(params[:id])

    if @address.update(address_params)
      redirect_to user_addresses_path(current_user), notice: 'Address was successfully updated.'
    else
      render :edit
    end
  end



  def destroy
    @user = current_user # Assuming you have a `current_user` method
    @address = @user.addresses.find(params[:id])

    if @address.destroy
      redirect_to user_path(@user), notice: 'Address was successfully deleted.'
    else
      redirect_to user_path(@user), alert: 'Failed to delete address.'
    end
  end
private

  def address_params
    params.require(:address).permit(:door_number, :street_area, :city, :state, :zipcode,:addressable_type,:addressable_id)
  end
end
