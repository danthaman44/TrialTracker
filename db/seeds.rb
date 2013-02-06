# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'sqlite3'

begin
	db = SQLite3::Database.open "development.sqlite3"
	db.execute "CREATE TABLE IF NOT EXISTS CRC (crcName TEXT PRIMARY KEY, dukeUniqueID TEXT)"
    db.execute "INSERT INTO CRC VALUES ('Ash Sundar', 0533117)"
    db.execute "INSERT INTO CRC VALUES ('Debra Freeman', 043043)"

    db.execute "CREATE TABLE IF NOT EXISTS Trial (trialName TEXT PRIMARY KEY, description TEXT)"
    db.execute "INSERT INTO Trial VALUES ('Cancer', 'A sample study')"

    db.execute "CREATE TABLE IF NOT EXISTS Study (crcName TEXT, trialName TEXT, 
    	patientName TEXT, enrolled TEXT, withdrawn TEXT, vulnerable TEXT, refused TEXT, 
    	lost TEXT)"
	db.execute "INSERT INTO Study VALUES ('Ash Sundar', 'Cancer', 'Sean Miller', 'yes', 
		'no', 'no', 'no', 'no')"
rescue Exception => e
	
	puts "Exception occured"
	puts e
ensure 
	db.close if db	
end