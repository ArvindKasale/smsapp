class SalesmanDailyReport < ActiveRecord::Base
  belongs_to :agent_call
  belongs_to :sales_user, :foreign_key => :user_id
  belongs_to :shop_keeper
  belongs_to :product
  validates_presence_of :agent_call_id, :shop_keeper_id
  validates_numericality_of :quantity, :only_integer=>true, :unless=>lambda{|p| p.quantity.nil?}
  before_save :calculate_total
  
   RailsAdmin.config do |config|
    config.model ::SalesmanUser do
      edit do
        field :agent_call_id do
          
        end
        field :user_id
        field :shop_keeper_id
        field :product_id
        field :quantity
      end
      
    end
   end
   
   def calculate_total
    p "In before save"
    if (self.quantity)
      p "In valid"
      self.sales_cost= self.quantity * self.product.price.to_f unless self.product.price.nil?
    else
      p "In invalid"
      errors.add(:quantity, "can't be zero or negative.")
    end
  end
end
