class Category < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_format_of :name, :with=>/^[\w &_,\/.-]*$/, :message=>"has invalid characters. Only alphanumeric characters _-.,&/ and white spaces are allowed"
  has_many :products, :dependent=> :destroy

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
