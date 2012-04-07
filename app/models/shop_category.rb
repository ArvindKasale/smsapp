class ShopCategory < ActiveRecord::Base
  has_many :shop_keepers
  validates_presence_of :name
end
