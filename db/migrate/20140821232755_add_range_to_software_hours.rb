class AddRangeToSoftwareHours < ActiveRecord::Migration
  def self.up
    add_column :software_hours, :range, :string
  end

  def self.down
    remove_column :software_hours, :range
  end
end
