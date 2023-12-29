class RestaurantsController < ApplicationController
  def show
    # binding.pry
    @locations = Address.locations
    @restaurant = Restaurant.find(params[:id])
    @food_items = @restaurant.food_items
 
    if user_signed_in?
      cart_items = current_user.cart.cart_items || nil
    else
      cart_items =nil
    end     
   
    if cart_items.nil?
      @cart_food_item_ids = []
    else
      @item_in_cart = cart_items.map { |cart_item| {food_item_id: cart_item.food_item.id, quantity: cart_item.quantity }}  

      @cart_food_item_ids = cart_items.map { |cart_item| cart_item.food_item.id }  
    end

  end
end
