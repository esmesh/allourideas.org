class AddNameToOrganizationType < ActiveRecord::Migration
  def self.up
    add_column :organization_types, :name, :string
  end

  def self.down
    remove_column :organization_types, :name
  end
end
