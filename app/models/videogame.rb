class Videogame

  attr_accessor :id, :name, :release_date, :genre, :gameplay, :steen_rating

  def initialize(videogame_hash)
    @id = videogame_hash['id']
    @name = videogame_hash['name']
    @release_date = videogame_hash['release_date']
    @genre = videogame_hash['genre']
    @gameplay = videogame_hash['gameplay']
    @steen_rating = videogame_hash['steen_rating']
  end

end