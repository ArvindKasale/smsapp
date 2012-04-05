class ChangeMessaheCall < ActiveRecord::Migration
  def self.up
  remove_column :agent_calls, :message
  add_column :agent_calls, :message, :text
  end

  def self.down
  end
end
