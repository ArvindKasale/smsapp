class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  #attr_reader :name 
  validates_uniqueness_of :name
  validates_presence_of :role_id,:name,:phone_no,:birth_date
 # has_and_belongs_to_many :locations
 belongs_to :role
 #has_one :profile, :dependent=> :destroy
 #has_many :sale_items, :dependent=> :destroy


  RailsAdmin.config do |config|
    config.model ::User do
    edit do
      field :name
      field :email
      field :address
      field :birth_date
      field :phone_no
      field :password
      field :password_confirmation
      field :role_id
      
   end

  list do
      field :name
      field :email
      field :phone_no
      field :role_id
      field :created_at
      
   end

   
  end
end


 
   
end
