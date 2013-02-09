#!/usr/bin/ruby


require 'read.rb'

begin
	r = READ.new
	test = r.read_trialsforthiscrc("Sam")
	test.each do |test|
        puts test
    end

	dataArray = r.read_patientsfromtrialbyacrc("Cancer", "Sam")
	dataArray.each do |dataArray|
        puts dataArray
    end
end

