class AgentCall < ActiveRecord::Base
  
  validates_presence_of  :shop_id
  belongs_to :sales_user, :foreign_key => :user_id
  belongs_to :shop_keeper, :foreign_key => :shop_id  
  validate :check_duration
  
  RailsAdmin.config do |config|
    config.model ::AgentCall do
      edit do
        field :user_id
        field :shop_id
        field :category, :enum do
          enum do
            {"Morning Call" => "Morning Call" , "Evening Call" => "Evening Call" }
          end
        end
        #field :attending
        field :message
        field :duration do
          label "Date"
        end                        
        
      end
      
      list do
        field :user_id
        #
        field :shop_id
        field :category
        #field :attending
        field :duration do
          label "Date"
        end                        
        
      end
      
    end
  end
  
  def check_duration
      if self.duration
        unless self.duration <= DateTime.now
          p "Invalid Date"
          errors.add(:duration, "can't be in the future.")
        end
      end
  end
  
end
