class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :song
      t.string :artist
      t.string :genre
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
