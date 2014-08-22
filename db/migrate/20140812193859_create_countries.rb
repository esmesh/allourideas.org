class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |table|
      table.timestamps
    end

  end

  def self.down
    drop_table :countries
  end
end
