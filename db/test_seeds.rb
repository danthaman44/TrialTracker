#!/usr/bin/ruby


require 'seeds.rb'

begin
	s = SEED.new
	s.crc_seed("Sam", "11921")
end