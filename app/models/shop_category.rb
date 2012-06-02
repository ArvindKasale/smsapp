class ShopCategory < ActiveRecord::Base
  has_many :shop_keepers
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_format_of :name, :with=>/^[a-zA-Z\s]+$/, :message=>"has invalid characters. Only alphabets are allowed"
  
  RailsAdmin.config do |config|
    config.model ::ShopCategory do
      
      list do
        field :name
        field :description
      end
      
      edit do
        field :name
        field :description
      end
      
    end
  end
  
  
end
