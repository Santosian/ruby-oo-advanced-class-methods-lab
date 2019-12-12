class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize()
  end
  
  def self.create
    song_instance = self.new
    @@all << song_instance
    return song_instance
  end

  def self.new_by_name(name)
    song_instance = self.new
    song_instance.name = name
    return song_instance
  end

  def self.create_by_name(name)
    song_instance = self.new
    song_instance.name = name
    @@all << song_instance
    return song_instance
  end

  def self.find_by_name(name)
    idx = 0
    while idx < @@all.length
      if @@all[idx].name == name
        return @@all[idx]
      end
      idx += 1
    end

    return nil
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      return song
    else
      return self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |x|
      x.name
    end
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    song = self.create
    song.artist_name = data[0]
    song.name = data[1].gsub(".mp3","")
    return song
  end

  def self.create_from_filename(filename)
    creation = self.new_from_filename(filename)  
    @@all << creation
    return creation
  end

  def self.destroy_all
    @@all = []
  end
  

  

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
