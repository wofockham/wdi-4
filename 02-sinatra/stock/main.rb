require 'pry'
require 'sinatra'
require 'yahoofinance'
require 'sinatra/reloader'
require 'active_support/all'

get '/stock' do
  @symbol = params[:symbol]
  if @symbol.present? # Via active_support/all, this saves us comparing @symbol != ''
    @symbol.upcase!
    @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
  end
  erb :stock
end
