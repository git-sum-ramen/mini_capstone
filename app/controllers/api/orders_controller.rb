class Api::OrdersController < ApplicationController
  def index
    # @orders = Order.where(user_id: current_user.id)
    @orders = current_user.orders
    render 'index.json.jb'
  end
  
  def create
    # how can i figure out what's in the user's shopping cart?
    carted_products = current_user.carted_products.where(status: "carted")
    
    subtotal = 0
    carted_products.each do |cp|
      subtotal += cp.product.price * cp.quantity
    end

    tax_rate = 0.09
    
    tax = subtotal * tax_rate
    total = tax + subtotal
    
    # p "HERE IS THE SUM"
    # p sum
    # p "/HERE IS THE SUM"
    
    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total,      
    )
    @order.save

    carted_products.update_all(status: "purchased", order_id: @order.id)
    # carted_products.each do |cp|
    #   # change the status
    #   cp.update(status: "purchased", order_id: @order.id)
    #   # add the order id
    # end
    
    render 'show.json.jb'
  end

  def show
    # @order = Order.find_by(id: params[:id])
    @order = current_user.orders.find_by(id: params[:id])
    render 'show.json.jb'
  end
end
