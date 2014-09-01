class CreateNumberOfUsers < ActiveRecord::Migration
  def self.up
    create_table :number_of_users do |t|
      t.string :range
    end
  end

  def self.down
    drop_table :number_of_users
  end
end
