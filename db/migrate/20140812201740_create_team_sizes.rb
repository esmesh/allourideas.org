class CreateTeamSizes < ActiveRecord::Migration
  def self.up
    create_table :team_sizes do |table|
      table.timestamps
    end

  end

  def self.down
    drop_table :team_sizes
  end
end
