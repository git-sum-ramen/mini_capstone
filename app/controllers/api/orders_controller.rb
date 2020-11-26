class Api::OrdersController < ApplicationController
  def index
    # @orders = Order.where(user_id: current_user.id)
    @orders = current_user.orders
    render 'index.json.jb'
  end
  
  def create
    @order = Order.new(
      user_id: current_user.id,
      subtotal: 100,
      tax: 10,
      total: 110,      
    )
    @order.save
    
    render 'show.json.jb'
  end

  def show
    # @order = Order.find_by(id: params[:id])
    @order = current_user.orders.find_by(id: params[:id])
    render 'show.json.jb'
  end
end
