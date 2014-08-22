class CreateSoftwareHours < ActiveRecord::Migration
  def self.up
    create_table :software_hours do |table|
      table.timestamps
    end

  end

  def self.down
    drop_table :software_hours
  end
end
