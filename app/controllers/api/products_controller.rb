class Api::ProductsController < ApplicationController
  def primero
    the_id = params[:id]
    @product =  Product.find_by(id: the_id)
    render 'first.json.jb'
  end

  def todo
    @products = Product.all
    render 'all.json.jb'
  end
end
