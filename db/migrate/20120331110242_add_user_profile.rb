class AddUserProfile < ActiveRecord::Migration
  def self.up
     add_column :users,:name, :string, :limit=> 50
     add_column :users,:address, :string, :limit=> 50
     add_column :users,:phone_no, :string, :limit=> 10
     add_column :users,:birth_date, :date
  end

  def self.down
  end
end
