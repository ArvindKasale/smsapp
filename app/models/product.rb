class Product < ActiveRecord::Base

  belongs_to :category
  has_many :product_prices


  validates_presence_of :name, :category_id
  validates_uniqueness_of :name


  RailsAdmin.config do |config|
    config.model ::Product do
    list do
      field :name
      field :description
      field :category_id
      field :price do
         label "Price (in Rupees)"       
      end
      field :created_at
     
    end

  edit do
      field :name
      field :description
      field :category_id
    end

    
  end
  end

  def price
   list =  self.product_prices

   unless list == []
       list.last.price         
   else
       nil
   end

  end

  
end
