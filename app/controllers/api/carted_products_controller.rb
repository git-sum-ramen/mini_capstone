class Api::CartedProductsController < ApplicationController
  def index
    # CartedProduct.where(user_id: current_user.id, status: "carted")
    @carted_products = current_user.carted_products.where(status: "carted")
    render 'index.json.jb'
  end
  
  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"    
    )
    @carted_product.save
    render 'show.json.jb'
  end

  def destroy
    # select the carted_product
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.update(status: "removed")
    render json: {messaage: "this item has been removed"}
    # .destroy
  end
end
