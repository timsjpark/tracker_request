class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.integer :uid
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :avatar_url
      t.integer :api_key

      t.timestamps null: false
    end
  end
end
