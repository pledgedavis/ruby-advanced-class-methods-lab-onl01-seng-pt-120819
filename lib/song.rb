require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
# def initialize(name)
#   @name = name
#   # @artist_name = artist_name
#   # @@all << self
# end
def self.create
  song = Song.new
  song.save
  song
 end
 def self.new_by_name(song_name)
   song = Song.new
   song.name = song_name
   song.save
   song
 end
 def self.create_by_name(created_song)
   song = self.new
   song.name = created_song
   song.save
   song
 end

   def self.find_by_name(name)
        @@all.find do |song|
           song.name == name
      # binding.pry

        end
    end


    def Song.find_or_create_by_name(name)
   self.find_by_name(name) || self.create_by_name(name)


    end

    def self.alphabetical
  self.all.sort_by {|song|song.name}
    end

    def self.new_from_filename(file_name)
      # file_name.sort_by
      new_song = self.new
     song_info = file_name.split(" - ")
      # file_name.gsub("Thundercat - For Love I Come.mp3","For Love I Come")
       new_song.artist_name = song_info[0]
     new_song.name = song_info[1].gsub(".mp3","")

          new_song
      # binding.pry
       end
       def self.create_from_filename(file_name)
      new_song = self.new
     song_info = file_name.split(" - ")
      # file_name.gsub("Thundercat - For Love I Come.mp3","For Love I Come")
       new_song.artist_name = song_info[0]
     new_song.name = song_info[1].gsub(".mp3","")
     new_song.save
       new_song
         end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end




  def self.destroy_all

    @@all =[]


  end
end
