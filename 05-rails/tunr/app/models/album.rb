# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :text
#  image      :text
#  created_at :datetime
#  updated_at :datetime
#

class Album < ActiveRecord::Base
  attr_accessible :name, :image
  has_many :songs
  has_many :artists, :through => :songs
end
