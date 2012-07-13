class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.integer :user_id
      t.integer :album_id
      t.date :date

      t.timestamps
    end
  end
end