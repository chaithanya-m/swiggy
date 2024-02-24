class RestaurantsController < ApplicationController

  def show
    @locations = Address.locations
    @restaurant = Restaurant.find(params[:id])
    @food_items = @restaurant.food_items

    if user_signed_in? && current_user.cart
      
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

    @suggestions = restaurant_data + dish_data
    respond_to do |format|
      format.html { render 'suggestions', layout: false }
      format.js   # This is for the AJAX request
    end  
  end

  def search
    @categories = Category.all  
    temp_array = session[:resent_search] || []
    session[:resent_search] = temp_array
  end

  def search_by
    city = Address.where(street_area: session[:location]).distinct.pluck(:city).last
    case params[:search_by] || 'Restaurants'

    when 'Restaurants'
      @restaurant = Restaurant.joins(:address).find_by(address: { city: city }, name: params[:query])
      @restaurants = Restaurant.joins(:address).where(address: { city: city }).where('name LIKE ?', "%#{params[:query]}%")
      respond_to do |format|
        format.html { render 'search_by_restaurents' }
        format.js   
      end  
    when 'Dishes'
      # binding.pry
      # restaurants = Restaurant.by_street_area(session[:location]).pluck(:id)
      restaurants=Restaurant.joins(:address).where(address:{city: city}).pluck(:id)
      @food_items = FoodItem.where(restaurant_id: restaurants).where("name LIKE ?", "%#{params[:query]}%")
      respond_to do |format|
        format.html { render 'search_by_dish' }
        format.js   
      end 
    end
  end

  def search_by_restaurents
    temp_object = session[:recent_search] || {}
    @restaurant = Restaurant.find(params[:suggestionId])
    
    unless temp_object.key?(@restaurant.id)
      temp_object[@restaurant.id] = {
        id: @restaurant.id,
        name: @restaurant.name,
        table_name: 'restaurant'
      }
      session[:recent_search] = temp_object
    end
    respond_to do |format|
      format.html { render 'search_by_restaurents' }
      format.js   
    end  
  end

  def search_by_dish
    @dish = Category.find(params[:suggestionId])
    city = Address.where(street_area: session[:location]).distinct.pluck(:city).last
    restaurants=Restaurant.joins(:address).where(address:{city: city})
    @food_items = FoodItem.joins(:restaurant, :category).where(category: { id:@dish.id , restaurants: { id: restaurants.map(&:id) } })
    respond_to do |format|
      format.html { render 'search_by_dish' }
      format.js   
    end 
  end
end
