# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  cuisine    :string(255)
#  chef       :string(255)
#  image      :text
#  created_at :datetime
#  updated_at :datetime
#

class Book < ActiveRecord::Base
  attr_accessible :title, :cuisine, :chef, :image, :recipe_ids
  has_many :recipes
end
