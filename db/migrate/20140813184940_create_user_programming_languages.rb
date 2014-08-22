class CreateUserProgrammingLanguages < ActiveRecord::Migration
  def self.up
    create_table :user_programming_languages do |t|
      t.belongs_to :user
      t.belongs_to :programming_language
    end

  end

  def self.down
    drop_table :user_programming_languages
  end
end
