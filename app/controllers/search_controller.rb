class SearchController < ApplicationController
  def index 
    @categories=Category.all
  end
end
