class AddPincodeToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :pincode, :string, :limit=> 10
  end

  def self.down
    remove_column :profiles, :pincode
  end
end
