class AddNameToComputationalResources < ActiveRecord::Migration
  def self.up
    add_column :computational_resources, :name, :string
  end

  def self.down
    remove_column :computational_resources, :name
  end
end
