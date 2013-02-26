# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#!/usr/bin/ruby 

t = Trial.new
t.trialName = 'Cancer'
t.endDate = Date.new(2012, 7, 30) 
t.enrolledGoal = 500
t.completedGoal = 250
t.save

g = Entry.new
g.input_at = Date.new(2012, 5, 12)
g.enrolled = 17
g.active = 12
g.withdrawn = 3
g.completed = 11
g.refused = 34
g.lost = 4
g.save

g = Entry.new
g.input_at = Date.new(2012, 5, 19)
g.enrolled = 23
g.active = 12
g.withdrawn = 8
g.completed = 4
g.refused = 4
g.lost = 3
g.save

g = Entry.new
g.input_at = Date.new(2012, 5, 26)
g.enrolled = 44
g.active = 17
g.withdrawn = 5
g.completed = 5
g.refused = 5
g.lost = 5
g.save

g = Entry.new
g.input_at = Date.new(2012, 6, 1)
g.enrolled = 32
g.active = 16
g.withdrawn = 5
g.completed = 5
g.refused = 5
g.lost = 5
g.save

g = Entry.new
g.input_at = Date.new(2012, 6, 8)
g.enrolled = 22
g.active = 36
g.withdrawn = 25
g.completed = 8
g.refused = 5
g.lost = 2
g.save

g = Entry.new
g.input_at = Date.new(2012, 6, 15)
g.enrolled = 24
g.active = 26
g.withdrawn = 14
g.completed = 3
g.refused = 8
g.lost = 12
g.save

g = Entry.new
g.input_at = Date.new(2012, 6, 22)
g.enrolled = 12
g.active = 16
g.withdrawn = 5
g.completed = 8
g.refused = 5
g.lost = 4
g.save