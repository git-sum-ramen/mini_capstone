class Product < ApplicationRecord
  validates :name, :price, :description, presence: true
  validates :description, length: { in: 10..500 }
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  
  
  def tax
    price * 0.09
  end

  def is_discounted?
    price < 10
    # if price < 10
    #   return true
    # else
    #   return false
    # end
  end

  def total
    price + tax
    # price + (price * 0.09)
  end
end
