class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name (name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name (name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name (name)
    @@all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name (name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename (filename)
    filename_array = filename.split(" - ")
    new_song = self.new
    new_song.artist_name = filename_array[0]
    new_song.name = filename_array[1].chomp(".mp3")
    new_song
  end

  def self.create_from_filename (filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
