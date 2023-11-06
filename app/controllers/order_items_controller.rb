class OrderItemsController < ApplicationController
  def create
    # binding.pry
    if params[:selected_address_id].nil?
      redirect_back(fallback_location: root_path)
    else
      @user = current_user
      @order= @user.orders.create
      @order.address_id = params[:selected_address_id]
      @order.save
      @cart = @user.cart
      @cart_items = @cart.cart_items
      @cart_items.each do |cart_item|
        @order_item = OrderItem.create( :order_id => @order.id, 
                        :food_item_id => cart_item.food_item.id,
                        :item_price => cart_item.food_item.price,
                        :quantity => cart_item.quantity,
                        :item_total_price => cart_item.quantity * cart_item.food_item.price)
        @order.total_price= @order.total_price + @order_item.item_total_price
        @order.total_items= @order.total_items + 1
      end
      if @order.save 
      @cart_items.destroy_all
      end
      UserMailer.with(order: @order ).orderPlaced_email.deliver_later
        redirect_to orders_path
    end
  end
end
