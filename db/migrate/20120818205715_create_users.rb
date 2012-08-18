class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name,          :null => false
      t.string :last_name,           :null => false
      t.string :display_name,        :null => false
      t.string :email,               :null => false
      t.string :crypted_password,    :null => false
      t.string :password_salt,       :null => false
      t.string :persistence_token,   :null => false
      t.string :perishable_token,    :null => false
      t.timestamps
    end
    add_index :users, ["email"], :name => "index_users_on_email", :unique => true
    add_index :users, ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true
  end

  def self.down
    drop_table :users
  end
end