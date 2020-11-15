class Product < ApplicationRecord
  validates :name, presence: true
  
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
