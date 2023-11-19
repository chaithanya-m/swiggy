class HomesController < ApplicationController
    def index
        # binding.pry

        @categories = Category.all
        location = Address.where(addressable_type: 'Restaurant').pluck(:street_area).uniq.first
        @restaurants = Restaurant.joins(:addresses).where(addresses: { street_area: session[:location] || location }).distinct

    end

    def select_location
        # binding.pry
        @categories = Category.all
        session[:location] = params[:selected_location]
        @restaurants = Restaurant.joins(:addresses).where(addresses: { street_area: params[:selected_location] }).distinct

        
        render 'index'

    end
    def filter
        binding.pry
        case params[:options_filter]
        when '300-600'
          @restaurants = Restaurant.joins(:food_items, :addresses)
          .where('food_items.price < ? AND addresses.street_area = ?', 300, params[:selected_location])
          .distinct
          render 'index'


        when 'Below 300'
         @restaurants = Restaurant.joins(:food_items, :address)
                         .where('food_items.price > ? AND addresses.street_area = ?', 300, params[:selected_location])
                         .distinct
          render 'index'
        when 'New'
          @users = @users.where(new: true)
        when 'Pure Veg'
          @users = @users.where(veg: true)
        end


    end
end
