class Company < ActiveRecord::Base


  validates_presence_of :name, :phone_no,:email
  validates_uniqueness_of :name
  validates_numericality_of :phone_no
  validates_length_of :phone_no, :is => 10 
   


end
