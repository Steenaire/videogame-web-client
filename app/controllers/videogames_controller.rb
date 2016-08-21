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
    creation_hash = { name: params[:name],release_date: params[:release_date],genre: params[:genre],gameplay: params[:gameplay],steen_rating: params[:steen_rating] }
    Videogame.create(creation_hash)
    redirect_to '/videogames'
  end

  def edit
    @videogame = Unirest.get("#{ENV['DOMAIN']}/videogames/#{params[:id]}.json").body
  end

  def update
    Videogame.find(params[:id]).update(params[:name],params[:release_date],params[:genre],params[:gameplay],params[:steen_rating])
    redirect_to '/videogames'
  end

  def destroy
    Videogame.find(params[:id]).delete
    redirect_to '/videogames'
  end

end
