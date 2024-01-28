class CartItemsController < ApplicationController
  
  def index
		if current_user == nil
			redirect_to new_user_session_path
		else
			@user = current_user
      @addresses = @user.addresses
			@cart= @user.cart || @user.create_cart
			@cart_items = @cart.cart_items.includes(:food_item)
		end
  end

  def create
      if current_user == nil
        redirect_to new_user_session_path
      else
      @user = current_user
      @item = FoodItem.find(params[:item_id])
      @cart= @user.cart || @user.create_cart
      @cart_item = @cart.cart_items.create(:food_item_id => @item.id,quantity:"1")
      redirect_to restaurant_path(@item.restaurant)
    end
  end

	def increment
    @cart= current_user.cart
    @food_item = FoodItem.find(params[:id])
    @cart_item = CartItem.find_by(cart_id: @cart.id, food_item_id: @food_item.id)
		@cart_item.increment!(:quantity)
    redirect_back(fallback_location: root_path)
  end

	def decrement
    @cart= current_user.cart
    @food_item = FoodItem.find(params[:id])
    @cart_item = CartItem.find_by(cart_id: @cart.id, food_item_id: @food_item.id)
    if @cart_item.nil? 
      redirect_back(fallback_location: root_path)
		elsif @cart_item.quantity <=1
      @cart_item.destroy
      redirect_back(fallback_location: root_path)
		else
		  @cart_item.decrement!(:quantity)
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy  
    @user = current_user
    @cart = @user.cart 
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_back(fallback_location: root_path)
  end
end
