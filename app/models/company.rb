class Company < ActiveRecord::Base


  validates_presence_of :name, :phone_no,:email, :contact_person, :city, :state, :address,:area, :pincode, :district
  validates_uniqueness_of :name,:email, :email_2
  validates_numericality_of :phone_no
  validates_numericality_of :phone_number_2, :unless=>lambda{|p| p.phone_number_2.nil?}
  validates_length_of :phone_no, :is => 10 
  validates_format_of :name,:contact_person, :with=>/^[a-zA-Z \s]+$/, :message=>"has invalid characters. Only alphabets are allowed"
  validates_format_of :city, :state, :address,:area,:district,:with=>/^[\w &_,\/.-]*$/, :message=>"has invalid characters. Only alphanumeric characters _-.,&/ and white spaces are allowed"
  validates_format_of :email, :with=>/\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, :message=>"has invalid characters."
  validates_format_of :email_2, :with=>/\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,:message=>"has invalid characters.", :unless=>lambda{|p| p.email_2.nil?}
  validates_format_of :website, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix, :unless=> lambda{|p| p.website.nil?}
  validates_numericality_of :fax, :unless=>lambda{|p| p.fax.nil?}
  has_and_belongs_to_many :products

 RailsAdmin.config do |config|
    config.model ::Company do
    edit do
      field :name
      field :contact_person
      field :address do
           label do
             "Address"
           end
      end
      field :street
      field :area
      field :city
      field :district
      field :state
      field :pincode do
        help do
          "Required. 6 characters."
        end
      end
      field :phone_no do
        label "Phone No 1"
      end
      field :phone_number_2 do
         help do
             "Optional"
         end
        label "Phone No 2"
      end
      field :email do
        label "Email 1"
      end
      field :email_2 do
         help do
             "Optional"
         end
      end
      field :fax do
        help do
          "Optional"
        end
      end
      field :website do
        help do
          "Optional"
        end
      end
      
      field :status
      field :products
  end
  list do
      field :name
      field :contact_person
      field :address_full do
        label "Address"
      end
      field :phone_no do
        label "Phone No 1"
      end
      field :website
      field :email do
        label "Email 1"
      end
      field :status
      field :products
  end
  end
end

def address_full
     address_full=""
     address_full+=(self.address+", ")unless(self.address.nil?)
     address_full+=(self.street+", ")unless(self.street.nil?)
     address_full+=(self.area+", ")unless(self.area.nil?)
     address_full+=(self.city+"-")unless(self.city.nil?)
     address_full+=(self.pincode+", ")unless(self.pincode.nil?)
     address_full+=(self.district+", ")unless(self.district.nil?)
     address_full+=(self.state)unless(self.state.nil?)
end
end
