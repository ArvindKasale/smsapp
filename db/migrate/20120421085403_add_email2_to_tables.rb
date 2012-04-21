class AddEmail2ToTables < ActiveRecord::Migration
  def self.up
    add_column :companies, :email_2, :string
    add_column :distributors, :email_2, :string
  end

  def self.down
    remove_column :distributors, :email_2
    remove_column :companies, :email_2
  end
end
