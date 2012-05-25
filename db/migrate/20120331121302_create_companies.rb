class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.string :phone_no, :limit=> 10
      t.string :email
      #t.text :products
      t.boolean :status, :default => 1
      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
