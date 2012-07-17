class SongsController < ApplicationController
  
  before_filter do
    redirect_to root_path unless current_user
  end

  def update
    @song = Song.find(params[:id])
    @song.update_attributes(params[:song])
    @song.save
    redirect_to album_path(@song.album)
    flash.now.alert = "song has been updated"
    @song.import_tags
  end

end
