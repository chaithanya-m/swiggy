class HomesController < ApplicationController
    def index
        # binding.pry

        @categories = Category.all
        @locations = Address.where(addressable_type: 'Restaurant').pluck(:street_area).uniq
        # session[:location] = Address.where(addressable_type: 'Restaurant').pluck(:street_area).uniq.first
        @restaurants = Restaurant.by_street_area(session[:location])
    end

    def select_location
        # binding.pry
        session[:location] = params[:location]
        @restaurants = Restaurant.by_street_area(session[:location])
        # redirect_to action: 'index'
        redirect_to root_path
        
    end
    def filter
        # binding.pry
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
