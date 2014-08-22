class CreateToolTypes < ActiveRecord::Migration
  def self.up
    create_table :tool_types do |table|
      table.timestamps
    end

  end

  def self.down
    drop_table :tool_types
  end
end
