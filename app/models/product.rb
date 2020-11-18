class Product < ApplicationRecord
  validates :name, :price, :description, presence: true
  validates :description, length: { in: 10..500 }
  belongs_to :supplier

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
