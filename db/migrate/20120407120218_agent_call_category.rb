class AgentCallCategory < ActiveRecord::Migration
  def self.up
    add_column :agent_calls, :category, :string
  end

  def self.down
    remove_column :agent_calls, :category
  end
end
