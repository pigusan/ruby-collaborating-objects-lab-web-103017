require 'pry'

class Artist

  attr_accessor :name
  attr_reader :songs


  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def add_song(new_song)
    song = Song.new(new_song)
    @songs << song.name
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    new_artist = nil
    @@all.each do |artist_inst_obj|
      if artist_inst_obj.name == name
        #binding.pry
        new_artist = artist_inst_obj
      end
    end
    new_artist = Artist.new(name) if !new_artist
    new_artist
  end

  def print_songs
    @songs.each do |song|

      puts song.name
    end
    #binding.pry
  end
end
