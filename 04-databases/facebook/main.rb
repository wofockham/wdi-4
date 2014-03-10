require 'sqlite3'
require 'pry'

db = SQLite3::Database.open('facebook.db')

db.execute( "SELECT * FROM users" ) do |row|
  puts row
end

puts '----------------------------------------------------------------------'

columns, *rows = db.execute2( "SELECT * FROM users" )
binding.pry

rows.each do |row|
  row.each_with_index do |value, i|
    puts "#{columns[i]}: #{value}"
  end
end
