class AddNameToEducationLevel < ActiveRecord::Migration
  def self.up
    add_column :education_levels, :name, :string
  end

  def self.down
    remove_column :education_levels, :name
  end
end
