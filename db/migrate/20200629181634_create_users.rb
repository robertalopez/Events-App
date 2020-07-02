class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.text :bio
      t.string :profile_picture

      t.timestamps
    end
  end
end
