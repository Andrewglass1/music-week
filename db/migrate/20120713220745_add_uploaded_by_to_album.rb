class AddUploadedByToAlbum < ActiveRecord::Migration
  def change
  	add_column :albums, :uploaded_by, :integer
  end
end
