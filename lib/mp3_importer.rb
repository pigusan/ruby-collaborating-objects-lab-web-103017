class MP3Importer

  attr_reader :path, :files



  def initialize(path)
    @path = path
    #@files = files
  end

  def files
    file_paths = Dir["#{@path}/**/*.mp3"]

    normalized_files = file_paths.collect do |mp3s|
      mp3s.gsub('./spec/fixtures/mp3s/', '')
    end
    #normalized_files
  end


  def import
    imported_files = files.each{ |filename| Song.new_by_filename(filename) }
    imported_files
    #binding.pry
  end

end
