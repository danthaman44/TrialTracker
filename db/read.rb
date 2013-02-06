#!/usr/bin/ruby

require 'sqlite3'

class READ
    def read_table (tabl="Study")
        db = SQLite3::Database.open "development.sqlite3"
    
        stm = db.prepare "SELECT * FROM #{tabl}" 
        rs = stm.execute 
    
        rs.each do |row|
            puts row.join "\s"
        end
           
        rescue SQLite3::Exception => e 
    
            puts "Exception occured"
            puts e
    
        ensure
            stm.close if stm
            db.close if db
    end
end
