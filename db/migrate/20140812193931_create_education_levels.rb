class CreateEducationLevels < ActiveRecord::Migration
  def self.up
    create_table :education_levels do |table|
      table.timestamps
    end

  end

  def self.down
    drop_table :education_levels
  end
end
