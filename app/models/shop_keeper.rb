class ShopKeeper < ActiveRecord::Base

  belongs_to :shop_category
  has_and_belongs_to_many :products
  validates_presence_of :name,:address_1,:pincode,:district,:city,:state,:shop_category_id, :contact_person, :area, :phone_no_1, :email
  validates_uniqueness_of :name
  validates_length_of :phone_no_1, :is => 10
  validates_length_of :phone_no_2, :is => 10, :unless=>lambda{|p| p.phone_no_2.nil?}
  validates :pincode, :length=>{:is=>6}, :numericality=> true
  validates_format_of :contact_person, :city, :district, :state, :with=>/^[a-zA-Z\s]+$/, :message=>"has invalid characters. Only alphabets and spaces are allowed"
  validates_format_of :name, :street, :area, :address_1, :with=>/^[\w &_,\/.-]*$/, :message=>"has invalid characters. Only alphanumeric characters _-.,&/ and white spaces are allowed"
  validates_numericality_of :phone_no_1,:pincode
  validates_numericality_of :phone_no_2,:unless=>lambda{|p| p.phone_no_2.nil?}
  validates_format_of :email, :with=>/\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, :message=>"has invalid characters."
  validates_format_of :email_2, :with=>/\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, :message=>"has invalid characters.",:unless=>lambda{|p| p.email_2.nil?}
  
  RailsAdmin.config do |config|
    config.model ::ShopKeeper do
      edit do
        field :name do
          label "Shop Name"  
        end
        field :contact_person
        field :products
        field :address_1 do
          label "Address"
        end
      #  field :address_2
        field :street
        field :area
        field :city
        field :pincode
        field :district
        field :state
        field :email
        field :email_2 do
           help do
             "Optional"
           end
        end
        field :phone_no_1 do
          label "Phone Number 1"
        end
        field :phone_no_2 do
           help do
             "Optional"
           end
          label "Phone Number 2"
        end
        field :shop_category_id
      end
      list do
        field :name do
          label "Shop Name"
        end
        field :contact_person
        field :products
        field :address
        #field :address_2
        field :email
        field :phone_no_1
        field :shop_category_id
      end
    end
  end
 def address
     address=""
     address+=(self.address_1+", ")unless(self.address_1.nil?)
     address+=(self.street+", ")unless(self.street.nil?)
     address+=(self.area+", ")unless(self.area.nil?)
     address+=(self.city+"-")unless(self.city.nil?)
     address+=(self.pincode+", ")unless(self.pincode.nil?)
     address+=(self.district+", ")unless(self.district.nil?)
     address+=(self.state)unless(self.state.nil?)
   end

end
