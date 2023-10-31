class HomesController < ApplicationController
    def index
			@categories = Category.all
			@restaurants = Restaurant.all
    end
end
