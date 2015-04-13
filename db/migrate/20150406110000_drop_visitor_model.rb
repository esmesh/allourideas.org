class DropVisitorModel < ActiveRecord::Migration
  def self.up
	  drop_table :visitor
  end

  def self.down
	  raise ActiveRecord::IrreversibleMigration
  end
end
