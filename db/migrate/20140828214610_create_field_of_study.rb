class CreateFieldOfStudy < ActiveRecord::Migration
  def self.up
    create_table :field_of_studies do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :field_of_studies
  end
end
