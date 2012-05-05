class AgentCall < ActiveRecord::Base
  
  validates_presence_of :user_id, :shop_id
  belongs_to :salesman_user, :foreign_key => :user_id
  belongs_to :shop_keeper, :foreign_key => :shop_id  
  
  
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
        field :attending
        field :message
        field :duration do
          label "Date & call duration"
        end                        
        
      end
      
      list do
        field :user_id
        field :shop_id
        field :category
        field :attending
        field :duration do
          label "Date & call duration"
        end                        
        
      end
      
    end
  end
  
  
  
end
