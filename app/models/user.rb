class User < ActiveRecord::Base

  has_attached_file :pic, :styles => {:thumb => "100x100" }
  # add a delete_<asset_name> method: 
  attr_accessor :delete_pic
 before_validation { self.pic.clear if self.delete_pic == '1' }


  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,:email_2, :password, :password_confirmation, :remember_me, :name, :address_1, :birth_date, :phone_no_1, :address_2,:street, :area, :emergency_name,:emergency_no,:city,:district,:state,:pic
  #attr_reader :name
  validates_uniqueness_of :name
  #validates_format_of :email_2, :with=>"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|com|org|net|edu|gov|biz|info)\b", :message=>"format is invalid."
  #validates_length_of :phone_no_1, :emergency_no, :is => 10
  validates_numericality_of :phone_no_1, :emergency_no
  validates_presence_of :role_id,:name,:birth_date, :address_1, :city, :state, :district, :phone_no_1, :emergency_name, :emergency_no
  validates_format_of :name, :emergency_name, :with=>/^[a-zA-Z\s]+$/, :message=>"has invalid characters. Only alphabets and spaces are allowed"
  #validates_format_of :password, :with=>/^\w*(?=\w*\d)(?=\w*[a-z])(?=\w*[A-Z])\w*$/, :message=>"must contain atleast one capital letter, one number and no special characters."
  validates_format_of :city,:district,:state, :with=>/^[\w &_,\/.-]*$/, :message=>"has invalid characters. Only alphanumeric characters _-.,&/ and white spaces are allowed"
  validate :birth_date, :check_birth_date_valid
  # has_and_belongs_to_many :locations
  belongs_to :role
  #has_one :profile, :dependent=> :destroy
  #has_many :sale_items, :dependent=> :destroy
  
  def check_birth_date_valid
    if self.birth_date
      if self.birth_date.future?
        errors.add(:birth_date, "can't be in the future.")
      else
        if ((self.birth_date+18.years)>Date.today)
          errors.add(:birth_date, "is invalid. User should be older than 18 years.")
        end
      end
    end
  end

  RailsAdmin.config do |config|
     config.model ::User do
       edit do
         field :role_id
         field :name
         field :email
         field :password
         field :password_confirmation
         field :birth_date
	       field :address_1
         field :address_2
         field :street
         field :area
         field :city
         field :pincode
         field :district
         field :state
         field :phone_no_1
         field :phone_no_2
         field :emergency_name do
           label do
             "Emergency Contact Name"
           end
         end
         field :emergency_no do
           label do
             "Emergency Contact no."
           end
         end
         
         
       end
       list do
         field :name
         field :email
         field :birth_date
	       field :role_id
         field :address
         field :phone_no_1
         field :phone_no_2
         field :emergency_name do
           label do
             "Emergency Contact Name"
           end
         end
         field :emergency_no do
           label do
             "Emergency Contact no."
           end
         end
         field :created_at
 
       end
     end
   end
   
   def address
     address=""
     address+=(self.address_1+", ")unless(self.address_1.nil?)
     address+=(self.address_2+", ")unless(self.address_2.nil?)
     address+=(self.street+", ")unless(self.street.nil?)
     address+=(self.area+", ")unless(self.area.nil?)
     address+=(self.city+"-")unless(self.city.nil?)
     address+=(self.pincode+", ")unless(self.pincode.nil?)
     address+=(self.district+", ")unless(self.district.nil?)
     address+=(self.state)unless(self.state.nil?)
   end
end
