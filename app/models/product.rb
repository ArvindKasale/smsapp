class Product < ActiveRecord::Base

  belongs_to :category
  has_many :product_prices, :dependent=> :destroy
  has_and_belongs_to_many :shop_keepers
  has_and_belongs_to_many :companies


  validates_presence_of :name, :category_id, :alias
  validates_uniqueness_of :name, :alias
  validates_length_of :name, :maximum=>50
  validates_format_of :name,:alias, :with=>/^[\w &_,\/.-]*$/, :message=>"has invalid characters. Only alphanumeric characters _-.,&/ and white spaces are allowed"
 

  RailsAdmin.config do |config|
    config.model ::Product do
    list do
      field :name
      field :alias
      field :description
      field :category_id
      field :price do
         label "Price (in Rupees)"       
      end
      field :created_at
     
    end

  edit do
      field :name
      field :alias
      field :description
      field :category_id
      field :companies
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
