class SalesmanUser < User

 RailsAdmin.config do |config|
    config.model ::SalesmanUser do
      edit do
        field :name
        field :email
        field :address
        field :birth_date
        field :phone_no
        field :password
        field :password_confirmation
        
      end
      list do
        field :name
        field :email
        field :phone_no
        field :created_at

      end
    end
  end

  def before_save
      self.role_id = 0
  end

end
