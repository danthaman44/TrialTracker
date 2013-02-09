#!/usr/bin/ruby

require 'sqlite3'
require 'seeds.rb'

class READ
    def read_trialsforthiscrc (cname)
        db = SQLite3::Database.open "development.sqlite3"
    
        stm = db.prepare "SELECT trialName FROM Study WHERE (Study.crcName = '#{cname}')" 
        rs = stm.execute      

        dataArray = []
        rs.each do |row|
             dataArray.push (row.at(0))
        end

        rescue SQLite3::Exception => e 
            puts "Exception occured"
            puts e
        ensure
            stm.close if stm
            db.close if db

        return dataArray
    end

    def read_patientsfromtrialbyacrc (tname, cname)
        db = SQLite3::Database.open "development.sqlite3"
    
        stm = db.prepare "SELECT pID, enrolled, withdrawn, vulnerable, refused, lost FROM Study 
            WHERE Study.trialName = '#{tname}' AND Study.crcName = '#{cname}'" 
        rs = stm.execute 

        dataArray = []
        rs.each do |row|
            patientData = Hash["pID" => row.at(0), "enrol" => row.at(1), "withd" => row.at(2), "vulner" => row.at(3), 
                "ref" => row.at(4), "loss" => row.at(5)]
            dataArray.push(patientData)
        end

        rescue SQLite3::Exception => e 
            puts "Exception occured"
            puts e
        ensure
            stm.close if stm
            db.close if db
        
        return dataArray
    end
end
