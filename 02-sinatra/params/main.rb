require 'pry'
require 'sinatra'
require 'sinatra/reloader'

def flubber(xyz)
  puts "message from flubber: #{ xyz }"
end

flubber('literally') # => message from flubber: literally
flubber 'literally' # => message from flubber: literally

teepee = :hotdogs
flubber(teepee) # => message from flubber: hotdogs
flubber('teepee') # => message from flubber: teepee
flubber(:hotdogs) # => message from flubber: hotdogs

xyz = 8002
flubber(teepee) # => message from flubber: hotdogs

pq = 'this is bad'
def test
  puts pq
end

class Sandwich
  @slices_of_bread = 2

  def how_much_bread
    @slices_of_bread
  end
end