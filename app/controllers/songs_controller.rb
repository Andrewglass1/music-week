class SongsController < ApplicationController

  def update
    @song = Song.find(params[:id])
    @song.update_attributes(params[:song])
    @song.save
    redirect_to album_path(@song.album)
    flash.now.alert = "song has been updated"
    @song.import_tags
  end

end
