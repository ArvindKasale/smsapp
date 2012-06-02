class AddMoreColumnsToDistributor < ActiveRecord::Migration
  def self.up
    add_column :distributors, :fax, :string
    add_column :distributors, :website, :string
  end

  def self.down
    remove_column :distributors, :website
    remove_column :distributors, :fax
  end
end
