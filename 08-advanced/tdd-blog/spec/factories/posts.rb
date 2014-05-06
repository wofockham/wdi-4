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

FactoryGirl.define do
  factory :post do |f|
    f.sequence(:title) { |n| "TDD Post #{n}"}
    author "Craigsy and Jonesy, their love was forbidden"
    content { Faker::Lorem.sentence }
    published false
  end
end
