class ProductPrice < ActiveRecord::Base

  belongs_to :product
  validates_presence_of :price,:product_id
  validates_numericality_of :price

end
