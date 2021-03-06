# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#  content    :text
#  published  :boolean          default(FALSE)
#  author     :string(255)
#

class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :author, :presence => true

  scope :published, -> { where(:published => true) }
  scope :drafts, -> { where(:published => false) }

  has_many :comments
end
