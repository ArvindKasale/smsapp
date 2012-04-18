class SalesmanUser < User

  has_many :sale_items
  validates_presence_of :area

 RailsAdmin.config do |config|
    config.model ::SalesmanUser do
      label "Salesman Bio Data"
      edit do
        field :name
        field :email
        field :email_2
        field :address_1
         field :address_2 do
           label "Village Address"
         end
      #   field :street
         field :area, :enum do
            enum do
            ["East", "West"]
          end
         end
         field :city
         field :pincode
         field :district
         field :state
        field :birth_date
        field :phone_no_1, :string
        field :phone_no_2,:string
        field :password
        field :password_confirmation
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
	field :created_at

      end
    end
  end

  def before_save
      self.role_id = 0
  end

end
