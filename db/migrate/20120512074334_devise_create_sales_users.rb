class DeviseCreateSalesUsers < ActiveRecord::Migration
  def self.up
    create_table(:sales_users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :sales_users, :email, :unique => true
    add_index :sales_users, :reset_password_token, :unique => true
    add_column :sales_users,:name, :string, :limit=> 50
    add_column :sales_users,:address_1, :string, :limit=> 50
    add_column :sales_users,:phone_no_1, :string, :limit=> 10
    add_column :sales_users,:birth_date, :date
    add_column :sales_users, :address_2, :string
    add_column :sales_users, :street, :string
    add_column :sales_users, :area, :string
    add_column :sales_users, :city, :string
    add_column :sales_users, :pincode, :string, :limit=> 6
    add_column :sales_users, :district, :string
    add_column :sales_users, :state, :string
    add_column :sales_users, :phone_no_2, :string, :limit=> 10
    add_column :sales_users, :emergency_name, :string
    add_column :sales_users, :emergency_no, :string
    add_column :sales_users, :email_2, :string
    add_column :sales_users, :blood_group, :string
    add_column :sales_users, :work_exp, :string
    add_column :sales_users, :home_phone_1, :string
    add_column :sales_users, :home_phone_2, :string
    add_column :sales_users, :status, :string
    # add_index :sales_users, :confirmation_token,   :unique => true
    # add_index :sales_users, :unlock_token,         :unique => true
    # add_index :sales_users, :authentication_token, :unique => true
  end

  def self.down
    drop_table :sales_users
  end
end
