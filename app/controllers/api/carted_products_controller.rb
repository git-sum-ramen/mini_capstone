class Api::CartedProductsController < ApplicationController
  def create
    @carted_product = CartedProduct.new(
      user_id: 1,
      product_id: 27,
      quantity: 5,
      status: "carted"    
    )
    render 'show.json.jb'
  end
end
