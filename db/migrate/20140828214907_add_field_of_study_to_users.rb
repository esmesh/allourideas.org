class AddFieldOfStudyToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.references :field_of_studies
    end
  end

  def self.down
    remove_column :users, :field_of_studies
  end
end
