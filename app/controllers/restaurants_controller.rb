class RestaurantsController < ApplicationController

  def show
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

  def suggestions
    restaurant_data = Restaurant.by_street_area(session[:location])
                                .where("name LIKE ?", "%#{params[:query]}%")
                                .limit(10)
                                .pluck(:id, :name)
                                .map { |id, name| { id: id, name: name, table_name: 'restaurant' } }

    dish_data = Category.where("name LIKE ?", "%#{params[:query]}%")
                        .limit(10)
                        .pluck(:id, :name)
                        .map { |id, name| { id: id, name: name, table_name: 'dish' } }

    @data = restaurant_data + dish_data
    render json: @data
  end

  def search
    @categories = Category.all  
    case params[:search_by] || 'Restaurants'
    when 'Restaurants'
      @restaurants = Restaurant.by_street_area(session[:location]).where('name LIKE ?', "%#{params[:query]}%")          
      render :search
    when 'Dishes'
      restaurants = Restaurant.by_street_area(session[:location]).pluck(:id)
      @food_items = FoodItem.where(restaurant_id: restaurants).where("name LIKE ?", "%#{params[:query]}%")
      render :search
    end
  end

end
