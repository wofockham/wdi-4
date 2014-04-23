class HomeController < ApplicationController

  def index
    @countries = Country.select([:id, :abbreviation, :name, :north_america]);
  end

  def countries
    if params[:step].present?
      @countries = Country.select([:id, :abbreviation, :name, :north_america]).offset(params[:offset]).limit(params[:step])
    else
      @countries = Country.select([:id, :abbreviation, :name, :north_america])
    end
    render :json => @countries # Hi haters
  end

  def country
    @country = Country.find(params[:id])
    render :json => @country
  end
end
