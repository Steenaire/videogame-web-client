class VideogamesController < ApplicationController

  def index
    videogame_hashes = Unirest.get("#{ENV['DOMAIN']}/videogames.json").body
    @videogames = []

    videogame_hashes.each do |videogame|
      @videogames << Videogame.new(videogame)
    end
  end

  def show
    videogame_hash = Unirest.get("#{ENV['DOMAIN']}/videogames/#{params[:id]}.json").body
    @videogame = Videogame.new(videogame_hash)
  end

  def new
  end

  def create
    @videogame = Unirest.post("#{ENV['DOMAIN']}/videogames.json",
      parameters:{name: params[:name],
      release_date: params[:release_date],
      genre: params[:genre],
      gameplay: params[:gameplay],
      steen_rating: params[:steen_rating]
      }).body
    redirect_to '/videogames'
  end

  def edit
    @videogame = Unirest.get("#{ENV['DOMAIN']}/videogames/#{params[:id]}.json").body
  end

  def update
    @videogame = Unirest.patch("#{ENV['DOMAIN']}/videogames/#{params[:id]}.json",
      parameters:{name: params[:name],
      release_date: params[:release_date],
      genre: params[:genre],
      gameplay: params[:gameplay],
      steen_rating: params[:steen_rating]
      }).body
    redirect_to '/videogames'
  end

  def destroy
    Unirest.delete("#{ENV['DOMAIN']}/videogames/#{params[:id]}.json").body
    redirect_to '/videogames'
  end

end
