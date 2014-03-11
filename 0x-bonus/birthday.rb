require 'date'

class Birthday
  attr_reader :birthdate

  def initialize(year, month, day)
    @birthdate = Date.new(year, month, day)
    @today = Date.today
  end

  def age_in_years
    # Return the number of years between today and the birthdate.
    ((@today - @birthdate).to_i / 365.25).to_i
  end

  def bash
    age_in_years.times do
      puts "punch"
    end
  end
end

joel = Birthday.new(1978, 7, 11)
joel.bash()

crowley = Birthday.new(1888, 10, 23)
crowley.bash()