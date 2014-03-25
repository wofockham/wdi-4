require 'open-uri'

class PinterestController < ApplicationController
  def show
    if params[:query].present?
      @query = params[:query]
    else
      @query = 'butterfly'
    end

    doc = Nokogiri::HTML(open("http://www.pinterest.com/search/pins/?q=#{ @query }"))
    images = doc.css('img.pinImg')
    @urls = images.map {|i| i.get_attribute('src')}
  end
end
