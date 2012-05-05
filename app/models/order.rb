class Order < ActiveRecord::Base
  belongs_to :company
  belongs_to :product
  validates_presence_of :status, :company_id, :product_id
  validates_presence_of :date_placed,:quantity_placed,:if=> lambda{|o| o.status=="Order Placed"}
  validates_presence_of :date_received, :quantity_received, :if=> lambda{|o| o.status=="Order Received"}
  validates_numericality_of :quantity_placed,:if=> lambda{|o| o.status=="Order Placed"}
  validates_numericality_of :quantity_received, :if=> lambda{|o| o.status=="Order Received"}
  
  validate :dates_if_future
  
  before_save :calculate_balance
  
  #validates_presence_of :date_placed,:date_received,:company_id,:product_id,:quantity_placed,:quantity_received
  #validates_numericality_of :quantity_placed,:quantity_received
  #validate :received_less_than_or_equal_to_placed
   RailsAdmin.config do |config|
     config.model ::Order do
       edit do
         field :status, :enum do
           label "Order Type"
           enum do
             {"Order Placed" => "Order Placed" , "Order Received" => "Order Received" }
           end
         end
         field :company_id
         field :product_id
         field :date_placed
         field :date_received
         
         field :quantity_placed
         field :quantity_received
         
        end
       list do
         field :company_id
         field :date_placed
         field :date_received
         field :product_id
         field :quantity_placed
         field :quantity_received
         field :balance
         field :status do
           label "Order Type"
         end
         
       end
     end
   end
  
  def calculate_balance
    @order=Order.where("product_id=? AND company_id=?",self.product_id,self.company_id).last
    if @order
      if self.status=="Order Placed"
        self.balance=@order.balance+self.quantity_placed
      else
        self.balance=@order.balance-self.quantity_received
      end
    else
      if self.status=="Order Placed"
        self.balance=0+self.quantity_placed
      else
        self.balance=0-self.quantity_received
      end
    end
  end
  
  def dates_if_future
    if self.date_placed
    unless self.date_placed <= Date.today
      p "Invalid Date"
      errors.add(:date_placed, "can't be in the future.")
    end
    elsif self.date_received
      unless self.date_received <= Date.today
      p "Invalid Date"
      errors.add(:date_received, "can't be in the future.")
    end
    end
    
  end
  # def received_less_than_or_equal_to_placed
    # if(self.quantity_received && self.quantity_placed)
    # if(self.quantity_received > self.quantity_placed)
       # errors.add(:quantity_received, "can't be greater than Quantity Placed.") 
    # end
    # if(self.date_received > self.date_placed)
       # errors.add(:date_received, "can't be greater than Date_Placed")  
    # end
    # end
  # end 
  
end
