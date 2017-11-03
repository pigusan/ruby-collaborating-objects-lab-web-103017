require 'pry'

class Song

  attr_accessor :name, :artist


  def initialize(name)
    @name = name
    @artist = artist
  end

  def self.new_by_filename(file_name)
    artist_name = file_name.split(" - ")[0]
    song_name = file_name.split(" - ")[1]
    new_instance = self.new(song_name)
    # binding.pry
    artist = Artist.find_or_create_by_name(artist_name)
    new_instance.artist = artist
    artist.songs << self
    new_instance
  end
end
