class AddSalesUserPic < ActiveRecord::Migration
  def self.up
    change_table :sales_users do |t|
      t.has_attached_file :pic
    end
  end

  def self.down
    drop_attached_file :users, :pic
  end
end
