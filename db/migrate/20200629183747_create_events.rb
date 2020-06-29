class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :date
      t.integer :user_id
      t.string :title
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
