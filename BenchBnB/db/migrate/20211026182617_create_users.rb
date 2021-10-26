class CreateUsers < ActiveRecord::Migration[5.2]
    def change
      create_table :users do |t|
        t.string :username, null: false
      end
  
      add_index :users, :username, unique: true
      add_column :users, :email, :string
      add_column :users, :password_digest, :string
      add_column :users, :session_token, :string
      add_index :users, :session_token
    end
end
