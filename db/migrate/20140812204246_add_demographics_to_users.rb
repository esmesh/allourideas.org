class AddDemographicsToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.references :age
      t.references :country
      t.references :education_level
      t.column :education_field, :string
      t.belongs_to :software_experience_years, :class_name => "ExperienceYears"
      t.belongs_to :domain_experience_years, :class_name => "ExperienceYears"
      t.references :organization_type
      t.column :position, :string
      t.column :institution, :string
      t.references :computational_resources
      t.belongs_to :hours_using_software, :class_name => "SoftwareHours"
      t.belongs_to :hours_developing_software, :class_name => "SoftwareHours"
      t.references :team_size
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :age_id
      t.remove :country_id
      t.remove :education_level_id
    end
  end
end
