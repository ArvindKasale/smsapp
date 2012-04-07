class ShopKeeper < ActiveRecord::Base
  belongs_to :shop_category
  validates_presence_of :name,:address_1,:address_2,:city,:state,:shop_category_id
  validates_uniqueness_of :name



  
end
