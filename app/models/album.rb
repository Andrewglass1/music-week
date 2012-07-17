class Album < ActiveRecord::Base
  attr_accessible :art, :artist, :name, :number_of_songs, :songs_attributes, :zip, :uploaded_by
  has_many :songs
  has_many :signups
  accepts_nested_attributes_for :songs
  mount_uploader :zip, ZipUploader

  # def read_zip
  #   zipped_album = open(zip.url)
  #   Zip::ZipFile.open(zipped_album) do |zipfile|
  #     zipfile.each do |file|
  #       puts file.inspect
  #       # self.songs.create(file: file)
  #     end
  #   end
  # end

  def uploader
    if uploaded_by
      user = User.find(uploaded_by)
      user.email if user
    end
  end

  def import_all
    tag_songs
    import_album_tags
    import_cover
  end

  def fetch_cover
    key = 'dd7362de3ee9247117b4d707413168d8'
    conn = Faraday.new(:url => 'http://ws.audioscrobbler.com') do |builder|
      builder.use Faraday::Request::UrlEncoded
      builder.use Faraday::Response::Logger
      builder.use Faraday::Adapter::NetHttp
    end
    response = conn.get "/2.0/?method=album.getinfo&api_key=#{key}&artist=#{artist.gsub(" ","+")}&album=#{name.gsub(" ","+")}"
    parse_art_xml(response.body)
    
  end

  def import_album_tags
    uri = songs.last.file_url
    Mp3Info.open(open(uri)) do |mp3|
      self.update_attributes(:name=> mp3.tag.album,
                             :artist => mp3.tag.artist)
    end
  end

  def import_cover
    self.update_attribute(:art, fetch_cover)
  end

  def tag_songs
    songs.each do |song|
      song.import_tags
    end
  end

private

  def parse_art_xml(response)
    xml = Nokogiri::XML(response)
    images = xml.xpath('//album/image')
    image = images.select {|image| image.attr('size') == 'large'}
    image[0].text
  end

end
