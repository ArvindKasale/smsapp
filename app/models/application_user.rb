class ApplicationUser < User

 has_attached_file :pic, :styles => {:thumb => "100x100" }
  # add a delete_<asset_name> method: 
  attr_accessor :delete_pic
 before_validation { self.pic.clear if self.delete_pic == '1' }


 RailsAdmin.config do |config|
    config.model ::ApplicationUser do
     edit do
         field :role_id
         field :name
         field :email
         field :email_2
         field :birth_date
         field :address_1
      #   field :address_2
         field :street
      #   field :area
         field :city
         field :pincode
         field :district
         field :state
         field :phone_no_1, :string
         field :phone_no_2, :string
	       field :password
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
