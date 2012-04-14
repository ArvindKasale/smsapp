class ApplicationUser < User

 RailsAdmin.config do |config|
    config.model ::ApplicationUser do
      edit do
        field :name
        field :email
        field :address
        field :birth_date
        field :phone_no, :string
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
