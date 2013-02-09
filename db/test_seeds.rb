#!/usr/bin/ruby


require 'seeds.rb'

begin
	s = SEED.new
	s.crc_seed("Ash", "117")
	s.crc_seed("Sam", "1221")

	s.trial_seed("Cancer", "1/1/1", "A Study")
	s.trial_seed("AIDS", "1/3/2", "Another Study")

	s.study_seed("Ash", "Cancer", "D133", "no", "no", "no", "no", "yes")
	s.study_seed("Ash", "AIDS", "D143", "yes", "no", "no", "no", "yes")
	s.study_seed("Sam", "Cancer", "D163", "no", "no", "yes", "no", "yes")
end