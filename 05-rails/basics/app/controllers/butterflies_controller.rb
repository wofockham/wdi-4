class ButterfliesController < ApplicationController
  def index
    render 'comingsoon'
  end

  def new
    redirect_to('/butterflies')
  end

  def faq
    render 'comingsoon'
  end
end