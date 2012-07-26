class AlbumsController < ApplicationController

  before_filter do
    redirect_to root_path unless current_user
  end

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
    @songs = @album.songs.sort_by(&:track_number)
  end

  def new
    render :layout => 'bare'
    @album = Album.new
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      redirect_to uploaded_path(:album_name => @album.name)
    else
      render :new
    end
  end

  def uploaded
    render :layout => 'bare'
  end

end
