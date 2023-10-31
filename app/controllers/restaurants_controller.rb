class RestaurantsController < ApplicationController
  def show
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
        @cart_food_item_ids = cart_items.map { |cart_item| cart_item.food_item.id }
    end
  end
end
