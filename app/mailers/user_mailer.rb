class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
  def orderPlaced_email

    # binding.break
    @order = params[:order]
    @url  = 'http://localhost:3000/orders'
    mail(to: @order.user.email, subject: 'Your order is placed')
  end

end
