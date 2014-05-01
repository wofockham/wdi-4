desc "Shows the number of artists in the database"
task :artist_count => :environment do
  puts Artist.count
end
