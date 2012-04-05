class Role < ActiveRecord::Base

  validates_presence_of :role
  validates_uniqueness_of :role
        
  has_many :users

  def name
       role.to_s
  end

  RailsAdmin.config do |config|
    config.model ::Role do
    list do
      field :role
      field :user_list do
         label "Users"       
      end
     
    end
  end
  end

  def user_list
    self.users.collect(&:name).join(', ')
  end

  
end
