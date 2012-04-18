class Company < ActiveRecord::Base


  validates_presence_of :name, :phone_no,:email
  validates_uniqueness_of :name,:email_2
  validates_numericality_of :phone_no
  validates_length_of :phone_no, :is => 10 
  validates_format_of :name, :with=>/^[\w &_,\/.-]*$/, :message=>"has invalid characters. Only alphanumeric characters _-.,&/ and white spaces are allowed"
  validates_format_of :email,:email_2, :with=>/\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, :message=>"has invalid characters."
   has_and_belongs_to_many :products

 RailsAdmin.config do |config|
    config.model ::Company do
    edit do
      field :name
      field :phone_no
      field :email
      field :email_2
      field :status
      field :products
  end
  end
end


end
