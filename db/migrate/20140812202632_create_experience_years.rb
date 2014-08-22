class CreateExperienceYears < ActiveRecord::Migration
  def self.up
    create_table :experience_years do |table|
      table.timestamps
    end

  end

  def self.down
    drop_table :experience_years
  end
end
