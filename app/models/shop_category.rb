class ShopCategory < ActiveRecord::Base
  has_many :shop_keepers
  validates_presence_of :name
  validates_format_of :name, :with=>/^[\w &_,\/.-]*$/, :message=>"has invalid characters. Only alphanumeric characters _-.,&/ and white spaces are allowed"
end
