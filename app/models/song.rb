require 'mp3info'
require 'open-uri'
require 'carrierwave'

class Song < ActiveRecord::Base
  attr_accessible :album_id, :length, :title, :file, :track_number, :remote_file_url
  belongs_to :album
  mount_uploader :file, FileUploader


  def import_tags
    uri = self.file_url
    Mp3Info.open(open(uri)) do |mp3|
        self.update_attributes(:title => mp3.tag.title,
                               :track_number => mp3.tag.tracknum)
    end
  end

end