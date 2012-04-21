class AddBiodatacolumnsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :email_2, :string
    add_column :users, :blood_group, :string
    add_column :users, :work_exp, :string
    add_column :users, :home_phone_1, :string
    add_column :users, :home_phone_2, :string
    add_column :users, :status, :string
  end

  def self.down
    remove_column :users, :email_2
    remove_column :users, :blood_group
    remove_column :users, :work_exp
    remove_column :users, :home_phone_1
    remove_column :users, :home_phone_2
  end
end
