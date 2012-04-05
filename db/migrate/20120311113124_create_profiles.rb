class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :first_name, :limit=> 50
      t.string :last_name, :limit=> 50
      t.string :address_1, :limit=> 50
      t.string :address_2, :limit=> 50
      t.string :landmark, :limit=> 50
      t.string :city, :limit=> 50
      t.string :state, :limit=> 50
      t.string :country, :limit=> 50, :default=>"India"
      t.integer :user_id
      t.string :phone_number_1, :limit=>25
      t.string :phone_number_2, :limit=> 25
      t.date :birth_date
      t.integer :employee_id

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
