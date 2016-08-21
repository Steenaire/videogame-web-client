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
    Videogame.create({ name: params[:name],release_date: params[:release_date],genre: params[:genre],gameplay: params[:gameplay],steen_rating: params[:steen_rating] })
    redirect_to '/videogames'
  end

  def edit
    @videogame = Videogame.find(params[:id])
  end

  def update
    Videogame.find(params[:id]).update({ name: params[:name],release_date: params[:release_date],genre: params[:genre],gameplay: params[:gameplay],steen_rating: params[:steen_rating] })
    redirect_to '/videogames/'
  end

  def destroy
    Videogame.find(params[:id]).delete
    redirect_to '/videogames'
  end

end
