class Api::OrdersController < ApplicationController
  def create
    @order = Order.new(
      user_id: 1,
      product_id: 27,
      quantity: 10,
      subtotal: 20,
      tax: 1.80,
      total: 21.80
    )
    @order.save
    render 'show.json.jb'
  end
end
