# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#!/usr/bin/ruby 

g = Entry.new
g.enrolled = 177
g.active = 117
g.withdrawn = 117
g.completed = 117
g.refused = 34
g.lost = 4
g.save

g = Entry.new
g.enrolled = 723
g.active = 512
g.withdrawn = 122
g.completed = 464
g.refused = 644
g.lost = 43
g.save

g = Entry.new
g.enrolled = 544
g.active = 76
g.withdrawn = 5
g.completed = 5
g.refused = 5
g.lost = 5
g.save