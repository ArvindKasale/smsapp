class ApplicationUser < User

 has_attached_file :pic, :styles => {:thumb => "100x100" }
  # add a delete_<asset_name> method: 
  attr_accessor :delete_pic
 before_validation { self.pic.clear if self.delete_pic == '1' }
 
 validates_uniqueness_of :name
 validates_length_of :phone_no_1, :emergency_no, :is => 10
 validates_length_of :phone_no_2,:is => 10,  :unless=>lambda{|p| p.phone_no_2.nil?}
  validates_length_of :pincode, :is => 6
  validates_numericality_of :phone_no_1, :emergency_no, :pincode
  validates_numericality_of :phone_no_2, :unless=>lambda{|p| p.phone_no_2.nil?}
  validates_presence_of :role_id,:name,:birth_date, :address_1, :city, :state, :district, :phone_no_1, :emergency_name, :emergency_no
  validates_format_of :name, :emergency_name, :city, :district, :state, :with=>/^[a-zA-Z\s]+$/, :message=>"has invalid characters. Only alphabets and spaces are allowed"
 validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
 validates_format_of :email_2, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :unless=>lambda{|p| p.email_2.nil?}
 RailsAdmin.config do |config|
    config.model ::ApplicationUser do
     edit do
         field :role_id
         field :name
         field :address_1 do
           label "Address"
         end
      #   field :address_2
         field :street
      #   field :area
         field :city
         field :pincode do
           help do
             "Required. 6 characters."
           end
         end
         field :district
         field :state
         field :email do
           label "Email 1"
         end
         field :email_2
         field :birth_date
         
         field :phone_no_1, :string do
           label "Mobile 1"
           help do
             "Required. 10 characters."
           end
         end
         field :phone_no_2, :string do
           help do
             "Optional"
           end
           label "Mobile 2"
         end
	       field :password do
	         help do
	           "Required"
	         end
	       end
         field :password_confirmation
         field :pic do
            :paperclip
         end
         field :emergency_name do
           label do
             "Emergency Contact Name"
           end
         end
         field :emergency_no do
           label do
             "Emergency Contact no."
           end
           help do
             "Required. 10 characters. "
           end
         end
       end
      list do
        field :name
        field :email
        field :phone_no_1
	      field :phone_no_2
        field :role_id
        field :created_at

      end
    end
  end

end
