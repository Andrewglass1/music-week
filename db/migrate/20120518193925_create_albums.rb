class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :artist
      t.string :art
      t.integer :number_of_songs
      t.string :zip
      t.timestamps
    end
  end
end
