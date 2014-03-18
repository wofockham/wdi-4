class PlanetsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @planets = Planet.order(:orbit)
  end

  def new
  end

  def create
    Planet.create(params[:planet])
    redirect_to planets_path
  end

  def show
    @planet = Planet.find params[:id]
  end

  def edit
    @planet = Planet.find params[:id]
  end

  def update
    planet = Planet.find params[:id]
    planet.update_attributes(params[:planet])
    redirect_to planets_path
  end

  def destroy
    planet = Planet.find params[:id]
    planet.destroy
    redirect_to planets_path
  end
end
