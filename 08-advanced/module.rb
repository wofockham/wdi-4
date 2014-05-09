module Mother
  def eyes
    :blue
  end

  def taste_in_literature
    :mild
  end
end

module Father
  def hair
    :purple
  end

  def taste_in_literature
    :excellent
  end
end

module Education
  def taste_in_literature
    :terrible
  end
end

class Son
  include Mother
  include Father
  include Education
end

class Daughter
  include Mother
  include Father
  include Education
end

bertie = Son.new
puts bertie.eyes
puts bertie.hair

gertie = Daughter.new
puts gertie.hair
puts gertie.eyes
puts gertie.taste_in_literature





module Insect
  class Butterfly
  end

  class Moth
  end
end

require 'pry'
binding.pry



