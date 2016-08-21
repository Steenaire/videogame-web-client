class VideogamesController < ApplicationController

  def index
    @videogames = Videogame.all
  end

  def show
    @videogame = Videogame.find(params[:id])
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
    Videogame.find(params[:id]).delete
    redirect_to '/videogames'
  end

end
