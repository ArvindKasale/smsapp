class Company < ActiveRecord::Base


  validates_presence_of :name, :phone_no,:email
  validates_uniqueness_of :name
  validates_numericality_of :phone_no
  validates_length_of :phone_no, :is => 10 
  validates_format_of :name, :with=>/^[\w &_,\/.-]*$/, :message=>"has invalid characters. Only alphanumeric characters _-.,&/ and white spaces are allowed"
  validates_format_of :email, :with=>/\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, :message=>"has invalid characters."



end
