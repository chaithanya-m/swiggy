class OrdersController < ApplicationController
  def index
    @orders = current_user.orders 
  end
  def show
    # binding.pry
    @order = Order.find(params[:id])
		@order_items = @order.order_items  
  end
  def destroy
    @order = Order.find(params[:id])
		@order_items = @order.order_items 
    @order_items.destroy_all
    @order.destroy
    redirect_back(fallback_location: root_path)


  end
end
