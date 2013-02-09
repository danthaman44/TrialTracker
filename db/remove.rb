#!/usr/bin/ruby 

require 'sqlite3'

class REMOVE
	def initialize
		@db = SQLite3::Database.open "development.sqlite3"
	end

	def delete_all
		@db.execute "DROP TABLE CRC"
		@db.execute "DROP TABLE Trial"
		@db.execute "DROP TABLE Study"
    end

	rescue SQLite3::Exception => e 
   		puts "Exception occured"
    	puts e
	ensure
 	   @db.close if @db
end