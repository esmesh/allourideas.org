class AddNameToProgrammingLanguages < ActiveRecord::Migration
  def self.up
    add_column :programming_languages, :name, :string
  end

  def self.down
    remove_column :programming_languages, :name
  end
end
