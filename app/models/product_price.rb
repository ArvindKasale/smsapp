class ProductPrice < ActiveRecord::Base

  belongs_to :product
  validates_presence_of :price,:product_id
  validates_numericality_of :price
  validates_length_of :price, :maximum => 5

  RailsAdmin.config do |config|
     config.model ::ProductPrice do
       edit do
         field :product_id
         field :price do
             help do
              "Required"
             end
         end
         field :date do
           label do
             "Date"
           end
         end  
       end
       list do
         field :product_id
         field :price
         field :date
       end
     end
  end
end
