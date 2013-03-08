# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#!/usr/bin/ruby 

t = Trial.new
t.trialName = 'Your Trial'
t.trialID = '123'
t.endDate = Date.new(2013, 12, 31) 
t.enrolledGoal = 400
t.completedGoal = 250
t.save

g = Entry.new
g.input_at = Date.new(2013, 3, 1)
g.enrolled = 17
g.active = 12
g.withdrawn = 3
g.completed = 11
g.refused = 4
g.lost = 4
g.save

g = Entry.new
g.input_at = Date.new(2013, 3, 7)
g.enrolled = 30
g.active = 12
g.withdrawn = 8
g.completed = 14
g.refused = 12
g.lost = 6
g.save

# g = Entry.new
# g.input_at = Date.new(2012, 5, 26)
# g.enrolled = 48
# g.active = 17
# g.withdrawn = 12
# g.completed = 25
# g.refused = 15
# g.lost = 10
# g.save

# g = Entry.new
# g.input_at = Date.new(2012, 6, 1)
# g.enrolled = 51
# g.active = 24
# g.withdrawn = 22
# g.completed = 34
# g.refused = 21
# g.lost = 14
# g.save

# g = Entry.new
# g.input_at = Date.new(2012, 6, 8)
# g.enrolled = 72
# g.active = 23
# g.withdrawn = 30
# g.completed = 42
# g.refused = 24
# g.lost = 17
# g.save

# g = Entry.new
# g.input_at = Date.new(2012, 6, 15)
# g.enrolled = 95
# g.active = 15
# g.withdrawn = 30
# g.completed = 50
# g.refused = 26
# g.lost = 20
# g.save

# g = Entry.new
# g.input_at = Date.new(2012, 6, 22)
# g.enrolled = 112
# g.active = 7
# g.withdrawn = 39
# g.completed = 61
# g.refused = 31
# g.lost = 24
# g.save

# g = Entry.new
# g.input_at = Date.new(2012, 6, 29)
# g.enrolled = 131
# g.active = 12
# g.withdrawn = 47
# g.completed = 73
# g.refused = 38
# g.lost = 30
# g.save

# g = Entry.new
# g.input_at = Date.new(2012, 7, 5)
# g.enrolled = 146
# g.active = 16
# g.withdrawn = 52
# g.completed = 88
# g.refused = 41
# g.lost = 36
# g.save

# g = Entry.new
# g.input_at = Date.new(2012, 7, 12)
# g.enrolled = 164
# g.active = 20
# g.withdrawn = 65
# g.completed = 100
# g.refused = 47
# g.lost = 40
# g.save

# g = Entry.new
# g.input_at = Date.new(2012, 7, 19)
# g.enrolled = 186
# g.active = 21
# g.withdrawn = 74
# g.completed = 117
# g.refused = 54
# g.lost = 46
# g.save

# g = Entry.new
# g.input_at = Date.new(2012, 7, 26)
# g.enrolled = 203
# g.active = 16
# g.withdrawn = 77
# g.completed = 129
# g.refused = 61
# g.lost = 50
# g.save

# g = Entry.new
# g.input_at = Date.new(2012, 8, 2)
# g.enrolled = 230
# g.active = 10
# g.withdrawn = 80
# g.completed = 140
# g.refused = 61
# g.lost = 50
# g.save

# g = Entry.new
# g.input_at = Date.new(2012, 8, 9)
# g.enrolled = 251
# g.active = 15
# g.withdrawn = 81
# g.completed = 155
# g.refused = 66
# g.lost = 53
# g.save
