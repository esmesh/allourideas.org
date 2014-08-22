class AddRangeToTeamSize < ActiveRecord::Migration
  def self.up
    add_column :team_sizes, :range, :string
  end

  def self.down
    remove_column :team_sizes, :range
  end
end
