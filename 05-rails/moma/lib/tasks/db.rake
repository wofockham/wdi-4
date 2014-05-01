namespace :db do
  desc "Drop, recreate and migrate the database"
  task :reset do
    puts "Artist count:"
    Rake::Task['artist_count'].invoke
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
  end

  desc "Reset AND reseed the database"
  task :reseed => :reset do
    Rake::Task['db:seed'].invoke
    puts "Artist count:"
    Rake::Task['artist_count'].invoke
end
