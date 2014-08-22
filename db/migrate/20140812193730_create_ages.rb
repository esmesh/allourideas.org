class CreateAges < ActiveRecord::Migration
  def self.up
    create_table :ages do |table|
      table.timestamps
    end

  end

  def self.down
    drop_table :ages
  end
end
