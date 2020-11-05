class Api::ProductsController < ApplicationController
  def primero
    @product = Product.last
    render 'first.json.jb'
  end

  def todo
    @products = Product.all
    render 'all.json.jb'
  end
end
