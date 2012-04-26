class AddCompanyContactPerson < ActiveRecord::Migration
  def self.up
    add_column :companies, :contact_person, :string
  end

  def self.down
    remove_column :companies, :contact_person
  end
end
