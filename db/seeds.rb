# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#!/usr/bin/ruby 

require 'sqlite3'

class SEED
	def initialize
		@db = SQLite3::Database.open "development.sqlite3"
	end

	def crc_seed (cname="Ash Sundar", duuid = "0503312")
		@db.execute "CREATE TABLE IF NOT EXISTS CRC (crcName TEXT PRIMARY KEY, dukeUniqueID TEXT)"
    	@db.execute "INSERT INTO CRC VALUES ('#{cname}', '#{duuid}')"
    end

    def trial_seed (tname="Can", desc="A sample study needing treatment")
	    @db.execute "CREATE TABLE IF NOT EXISTS Trial (trialName TEXT PRIMARY KEY, description TEXT)"
	    @db.execute "INSERT INTO Trial VALUES ('#{tname}', '#{desc}')"
	end

	def study_seed (cname="Ash Sundar", tname="Cancer", pname="Sean Mill", 
		enrol="yes", withd="no", vulner="no", ref="no", loss="no")
	    @db.execute "CREATE TABLE IF NOT EXISTS Study (crcName TEXT, trialName TEXT, 
	    	patientName TEXT, enrolled TEXT, withdrawn TEXT, vulnerable TEXT, refused TEXT, 
	    	lost TEXT)"
		@db.execute "INSERT INTO Study VALUES ('#{cname}', '#{tname}', '#{pname}', '#{enrol}', 
			'#{withd}', '#{vulner}', 
			'#{ref}', '#{loss}')"
	end

	rescue SQLite3::Exception => e 
   		puts "Exception occured"
    	puts e
	ensure
 	   @db.close if @db
end

