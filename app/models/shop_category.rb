class ShopCategory < ActiveRecord::Base
  has_many :shop_keepers
  validates_presence_of :name
  validates_format_of :name, :with=>/^[\w &_,\/.-]*$/, :message=>"has invalid characters. Only alphanumeric characters _-.,&/ and white spaces are allowed"
  
  RailsAdmin.config do |config|
    config.model ::ShopCategory do
      
      list do
        field :name
      end
      
      edit do
        field :name
      end
      
    end
  end
  
  
end
