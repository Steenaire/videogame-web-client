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
    @videogame = Videogame.find(params[:id])
  end

  def update
    update_hash = { name: params[:name],release_date: params[:release_date],genre: params[:genre],gameplay: params[:gameplay],steen_rating: params[:steen_rating] }

    Videogame.find(params[:id]).update(update_hash)
    redirect_to '/videogames/'
  end

  def destroy
    Videogame.find(params[:id]).delete
    redirect_to '/videogames'
  end

end
