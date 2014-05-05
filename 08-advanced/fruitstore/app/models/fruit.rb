class Fruit < ActiveRecord::Base

  belongs_to :stair

  def squishy?
    nil
  end

end
