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
    videogame_hash = Unirest.get("#{ENV['DOMAIN']}/videogames/#{id}.json", headers:{ "Accept" => "application/json", "Authorization" => "Token token=#{ENV['VIDEOGAMEAPIKEY']}", "X-User-Email" => "cmclarkey@gmail.com" }).body
    return Videogame.new(videogame_hash)
  end

  def self.all
    videogame_hashes = Unirest.get("#{ENV['DOMAIN']}/videogames.json", headers:{ "Accept" => "application/json", "Authorization" => "Token token=#{ENV['VIDEOGAMEAPIKEY']}", "X-User-Email" => "cmclarkey@gmail.com" }).body
    videogames = []

    videogame_hashes.each do |videogame_hash|
      videogames << Videogame.new(videogame_hash)
    end
    return videogames
  end

  def delete
    Unirest.delete("#{ENV['DOMAIN']}/videogames/#{self.id}.json", headers:{ "Accept" => "application/json", "Authorization" => "Token token=#{ENV['VIDEOGAMEAPIKEY']}", "X-User-Email" => "cmclarkey@gmail.com" }).body
  end

  def update(update_hash)
    Unirest.patch("#{ENV['DOMAIN']}/videogames/#{self.id}.json", parameters: update_hash, headers:{ "Accept" => "application/json", "Authorization" => "Token token=#{ENV['VIDEOGAMEAPIKEY']}", "X-User-Email" => "cmclarkey@gmail.com" }).body
  end

  def self.create(creation_hash)
    Unirest.post("#{ENV['DOMAIN']}/videogames.json", parameters: creation_hash, headers:{ "Accept" => "application/json", "Authorization" => "Token token=#{ENV['VIDEOGAMEAPIKEY']}", "X-User-Email" => "cmclarkey@gmail.com" }).body
  end

end