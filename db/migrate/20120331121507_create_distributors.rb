class CreateDistributors < ActiveRecord::Migration
  def self.up
    create_table :distributors do |t|
      t.string :name
      t.string :phone_no
      t.string :email
      t.text :address
      t.boolean :status, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :distributors
  end
end
