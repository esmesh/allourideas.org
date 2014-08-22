class AddRangeToAges < ActiveRecord::Migration
  def self.up
    add_column :ages, :range, :string
  end

  def self.down
    remove_column :ages, :range
  end
end
