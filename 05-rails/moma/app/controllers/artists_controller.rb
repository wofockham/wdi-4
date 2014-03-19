class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def create
    artist = Artist.create params[:artist]
    redirect_to artist
  end

  def new
    @artist = Artist.new
  end

  def edit
  end

  def show
    @artist = Artist.find params[:id]
  end

  def update
  end

  def destroy
  end
end
