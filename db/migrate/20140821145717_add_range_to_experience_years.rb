class AddRangeToExperienceYears < ActiveRecord::Migration
  def self.up
    add_column :experience_years, :range, :string
  end

  def self.down
    remove_column :experience_years, :range
  end
end
