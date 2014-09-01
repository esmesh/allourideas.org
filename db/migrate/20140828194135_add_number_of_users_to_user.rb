class AddNumberOfUsersToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.references :number_of_users
    end
  end

  def self.down
    remove_column :users, :number_of_users
  end
end
