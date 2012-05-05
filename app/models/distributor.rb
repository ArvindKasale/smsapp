class Distributor < ActiveRecord::Base

  validates_presence_of :name, :phone_no_1,:email, :address_1, :address_2, :city, :state, :district, :area
  validates_uniqueness_of :name
  validates_numericality_of :phone_no_1,:pincode
  validates_numericality_of :phone_no_2,:unless=>lambda{|p| p.phone_no_2.nil?}
  validates_length_of :pincode, :is => 6
  validates_length_of :phone_no_1, :is => 10
  validates_length_of :phone_no_2, :is => 10, :unless=>lambda{|p| p.phone_no_2.nil?}
  validates_format_of :name, :area, :city,:district,:state, :with=>/^[a-zA-Z \s]+$/, :message=>"has invalid characters. Only alphabets are allowed"
  validates_format_of :street, :with=>/^[a-zA-Z \s]+$/, :message=>"has invalid characters. Only alphabets are allowed", :unless=>lambda{|p| p.street.nil?}
  #validates_format_of :name, :with=>/^[\w &_,\/.-]*$/, :message=>"has invalid characters. Only alphanumeric characters _-.,&/ and white spaces are allowed"
  validates_format_of :address_1,:address_2, :with=>/^[\w &_,\/.-]*$/, :message=>"has invalid characters. Only alphanumeric characters _-.,&/ and white spaces are allowed"
  validates_format_of :email, :with=>/\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, :message=>"has invalid characters."
  validates_format_of :email_2, :with=>/\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, :message=>"has invalid characters.",:unless=>lambda{|p| p.email_2.nil?}
  RailsAdmin.config do |config|
     config.model ::Distributor do
       edit do
         field :name
         field :address_1 do
           label do
             "Address"
           end
         end
         #field :address_2 do
          # label do
           #  "Address Line 2"
           #end
         #end
         field :street
         field :area
         field :city
         field :pincode
         field :district
         field :state
         field :phone_no_1
         field :phone_no_2
         field :email do
           label "Email 1"
         end
         field :email_2 
         field :status
       end
       list do
         field :name
         field :address
         field :phone_no_1
         field :phone_no_2
         field :email
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
