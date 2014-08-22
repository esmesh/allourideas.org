class CreateComputationalResources < ActiveRecord::Migration
  def self.up
    create_table :computational_resources do |table|
      table.timestamps
    end

  end

  def self.down
    drop_table :computational_resources
  end
end
