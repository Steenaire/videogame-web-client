class VideogamesController < ApplicationController

  def index
    @videogames = Unirest.get("http://localhost:3000/api/v1/videogames.json").body
  end

  def show
    @videogame = Unirest.get("http://localhost:3000/api/v1/videogames/#{params[:id]}.json").body
  end

  def new
  end

  def create
    @videogame = Unirest.post("http://localhost:3000/api/v1/videogames.json",
      parameters:{name: params[:name],
      release_date: params[:release_date],
      genre: params[:genre],
      gameplay: params[:gameplay],
      steen_rating: params[:steen_rating]
      }).body
    redirect_to '/videogames'
  end

  def edit
    @videogame = Unirest.get("http://localhost:3000/api/v1/videogames/#{params[:id]}.json").body
  end

  def update
    @videogame = Unirest.patch("http://localhost:3000/api/v1/videogames/#{params[:id]}.json",
      parameters:{name: params[:name],
      release_date: params[:release_date],
      genre: params[:genre],
      gameplay: params[:gameplay],
      steen_rating: params[:steen_rating]
      }).body
    redirect_to '/videogames'
  end

  def destroy
    Unirest.delete("http://localhost:3000/api/v1/videogames/#{params[:id]}.json").body
    redirect_to '/videogames'
  end

end
