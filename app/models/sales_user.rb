class SalesUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,:email_2, :password, :password_confirmation, :remember_me, :name, :address_1, :birth_date, :phone_no_1, :address_2,:street, :area, :emergency_name,:emergency_no,:city,:district,:state,:pic
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
  validates_presence_of :name,:birth_date, :address_1, :city, :state, :district, :phone_no_1, :emergency_name, :emergency_no, :home_phone_1
  validates_format_of :name, :emergency_name, :city, :district, :state, :with=>/^[a-zA-Z\s]+$/, :message=>"has invalid characters. Only alphabets and spaces are allowed"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :email_2, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :unless=>lambda{|p| p.email_2.nil?}

  has_many :sale_items, :foreign_key => :user_id, :class_name => "SaleItem"
  has_many :agent_calls, :foreign_key => :user_id, :class_name => "AgentCall"
  validates_presence_of :area

  RailsAdmin.config do |config|
    config.model ::SalesUser do
      label "Salesman User"
      edit do
        field :name
        field :email do
          label "Email 1"
        end
        field :email_2 do
          help do
            "Optional"
          end
        end
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
        field :pincode do
          help do
            "Required. 6 characters."
          end
        end
        field :district
        field :state
        field :birth_date
        field :phone_no_1, :string do
          label "Mobile 1"
          help do
            "Required. 10 characters."
          end
        end
        field :phone_no_2,:string do
          help do
            "Optional"
          end
          label "Mobile 2"
        end
        field :home_phone_1, :string do
          label "Home Phone 1"
          help do
            "Required."
          end
        end
        field :home_phone_2, :string do
          help do
            "Optional"
          end
          label "Home Phone 2"
        end
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
        field :status, :enum do
          enum do
            ["Working","Non Working"]
          end
        end
        field :pic do
          :paperclip
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

  
  
end
