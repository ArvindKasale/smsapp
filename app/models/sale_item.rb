class SaleItem < ActiveRecord::Base

  belongs_to :sales_user, :foreign_key => :user_id
  belongs_to :product
 
  
  validates_presence_of :user_id, :product_id, :quantity, :sale_date
  validates_numericality_of :quantity, :only_integer=>true
  validate :quantity_is_positive
  
  scope :find_sales_of_user, lambda{|user_id| where("user_id=?",user_id)}

  validate :check_date_if_future
  before_save :calculate_total

  # def self.calculate_total_cost(sales_item)
  # sales_item.total_cost=sales_item.quantity * sales_item.product.price.to_f
  # puts sales_item.total_cost
  # return sales_item
  # end
  #
  # def self.calculate_total_cost(sales_item)
  # sales_item.total_cost=sales_item.quantity * sales_item.product.price.to_f
  # puts sales_item.total_cost
  # return sales_item
  # end

  RailsAdmin.config do |config|
    config.model ::SaleItem do
      edit do
        field :user_id do
          label "Sales Man"
        end
        field :sale_date
        field :product_id
        field :quantity
      end
      list do
        field :user_id do
          label "Sales Man"
        end
        field :sale_date
        field :product_id
        field :quantity
        field :total_cost do
          label "Total Cost (in Rupees)"
        end
      end
    end
  end

  def calculate_total
    p "In before save"
    if (self.quantity)
      p "In valid"
    self.total_cost= self.quantity * self.product.price.to_f unless self.product.price.nil?
    else
      p "In invalid"
      errors.add(:quantity, "can't be zero or negative.")
    end
  end

  def check_date_if_future
    unless self.sale_date <= Date.today
      p "Invalid Date"
      errors.add(:sale_date, "can't be in the future.")
    end
  end
  
  def before_save
    
    if self.user_id == nil
      self.user_id = User.first.id
    end  
  end
  
  def quantity_is_positive
    p "&&&&&&&&********************&&&&&&&&&&&&"
    if self.quantity
    unless self.quantity > 0
      errors.add(:quantity, "cant'be zero or negative.")  
    end
    end
  end

end
