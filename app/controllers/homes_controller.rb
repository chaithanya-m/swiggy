class HomesController < ApplicationController
    def index
        @categories = Category.all
        session[:location] = Address.where(addressable_type: 'Restaurant').pluck(:street_area).uniq.first
        @restaurants = Restaurant.by_street_area(session[:location])
    end
    
    def search
      @categories = Category.all 
    end
    def suggestions
      # binding.pry
      restaurant_data =Restaurant.by_street_area(session[:location]).where("name LIKE ?", "%#{params[:query]}%").limit(10).pluck(:id, :name).map { |id, name| { id: id, name: name, table_name: 'restaurant' } }
      restaurants = Restaurant.by_street_area(session[:location]).pluck(:id)
      food_item_data = FoodItem.where(restaurant_id: restaurants).where("name LIKE ?", "%#{params[:query]}%").limit(10).pluck(:id, :name).map { |id, name| { id: id, name: name, table_name: 'dish' } }
  
      @data = restaurant_data + food_item_data
      render json: @data

    end

    def search_by
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

    def select_location
      # binding.pry
      session[:location] = params[:selected_location]
      @restaurants = Restaurant.by_street_area(session[:location])
      render 'index'
    end

    def filter
        case params[:options_filter]
        when '300-600'
          @restaurants = Restaurant.by_street_area(session[:location]).price_range(300, 600)
          render 'index'
        when 'Below 300'
          @restaurants = Restaurant.by_street_area(session[:location]).below_price(300)
          render 'index'
        when 'New'
          @restaurants = Restaurant.by_street_area(session[:location]).newest_first
          render 'index'
        when 'Pure Veg'
          @restaurants = Restaurant.by_street_area(session[:location]).where("spaciality LIKE ? ", "%pure veg%" )
          render 'index'
        end
    end

end
