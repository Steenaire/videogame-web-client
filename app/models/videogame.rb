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

  def self.find(id)
    videogame_hash = Unirest.get("#{ENV['DOMAIN']}/videogames/#{id}.json").body
    return Videogame.new(videogame_hash)
  end

  def self.all
    videogame_hashes = Unirest.get("#{ENV['DOMAIN']}/videogames.json").body
    videogames = []

    videogame_hashes.each do |videogame_hash|
      videogames << Videogame.new(videogame_hash)
    end
    return videogames
  end

  def delete
    Unirest.delete("#{ENV['DOMAIN']}/videogames/#{self.id}.json").body
  end

  def update(name,release_date,genre,gameplay,steen_rating)
    Unirest.patch("#{ENV['DOMAIN']}/videogames/#{self.id}.json",
      parameters:{name: name,
      release_date: release_date,
      genre: genre,
      gameplay: gameplay,
      steen_rating: steen_rating
      }).body
  end

  def self.create(creation_hash)
    Unirest.post("#{ENV['DOMAIN']}/videogames.json",
      parameters:{name: creation_hash[:name],
      release_date: creation_hash[:release_date],
      genre: creation_hash[:genre],
      gameplay: creation_hash[:gameplay],
      steen_rating: creation_hash[:steen_rating]
      }).body
  end

end