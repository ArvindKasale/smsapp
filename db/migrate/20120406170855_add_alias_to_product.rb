class AddAliasToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :alias, :string
  end

  def self.down
    remove_column :products, :alias
  end
end
