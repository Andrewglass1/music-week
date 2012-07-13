class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :length
      t.integer :album_id
      t.string :file
      t.integer :track_number
      t.timestamps
    end
  end
end
