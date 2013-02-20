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
	
	@db = SQLite3::Database.open "development.sqlite3"
	t = Trial.create(:description => 'awesome', :tdate => 'today', :trialName => 'mytrial')
	Trial.create(:description => 'great', :tdate => 'tomorrow', :trialName => 'histrial')

	def crc_seed (cname, duuid)
		@db.execute "CREATE TABLE IF NOT EXISTS CRC (crcName TEXT, dukeUniqueID TEXT PRIMARY KEY)"
    	@db.execute "INSERT INTO CRC VALUES ('#{cname}', '#{duuid}')"
    end

    def trial_seed (tname, tdate, desc)
	    @db.execute "CREATE TABLE IF NOT EXISTS trials (trialName TEXT, tdate TEXT, description TEXT, PRIMARY KEY (trialName, tdate))"
	    @db.execute "INSERT INTO Trial VALUES ('#{tname}', '#{tdate}','#{desc}')"
	end

	def study_seed (cname, tname, pID, 
		enrol, withd, vulner, ref, loss)
	    @db.execute "CREATE TABLE IF NOT EXISTS Study (crcName TEXT, trialName TEXT, 
	    	pID TEXT, enrolled TEXT, withdrawn TEXT, vulnerable TEXT, refused TEXT, 
	    	lost TEXT, PRIMARY KEY (crcName, trialName, pID))"
		@db.execute "INSERT INTO Study VALUES ('#{cname}', '#{tname}', '#{pID}', '#{enrol}', 
			'#{withd}', '#{vulner}', 
			'#{ref}', '#{loss}')"
	end

	rescue SQLite3::Exception => e 
   		puts "Exception occured"
    	puts e
	ensure
 	   @db.close if @db
end

