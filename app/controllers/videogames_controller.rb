class VideogamesController < ApplicationController

  def index
    @videogames = Unirest.get("http://localhost:3000/api/v1/videogames.json").body
  end

  def show
    @videogame = Unirest.get("http://localhost:3000/api/v1/videogames/#{params[:id]}.json").body
  end

end
