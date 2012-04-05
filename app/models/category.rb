class Category < ActiveRecord::Base
  
  validates_presence_of :name
  validates_uniqueness_of :name	

  has_many :products

  RailsAdmin.config do |config|
    config.model ::Category do
    list do
      field :name
      field :description
      field :product_list do
        label "Products"
      end
    end
  end
  end

  def product_list
    self.products.collect(&:name).join(', ')
  end

  
end
