namespace :twitter do

  # Empty our User and Tweet tables -- a simple rake task using our rails app's models
  desc "Clear User and Tweet tables"
  task :clear => :environment do
    User.destroy_all
    Tweet.destroy_all
  end

  # This rake task accepts a parameter (user_count) to
  desc "Create dummy Twitter posts and users"
  task :posts, [:user_count] => :environment do |t, args|
    FactoryGirl.create_list :user_with_tweets, args[:user_count].to_i
  end

  # Using the Twitter API and oauth params we can search Twitter and save our results to our database
  # Accepts 2 parameters: search query and number of desired results
  desc "Search Twitter for a query and number of results"
  task :search, [:query, :limit] => :environment do |t, args|

  end

end