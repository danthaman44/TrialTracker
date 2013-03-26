c = Connections.new
c.acceptinguser = 'Sundar'
c.invitinguser = 'peggy'
c.status = 'accepted'
c.trialID = 123
c.save

dan = User.create({:username =>'wdd3', :password =>Digest::SHA2.hexdigest('pw'), :email =>'wdd3@duke.edu'})
sean = User.create({:username =>'vfseanm', :password =>Digest::SHA2.hexdigest('pw'), :email => 'sean@duke.edu'})
ash = User.create({:username =>'ashsunday', :password =>Digest::SHA2.hexdigest('pw'), :email => 'ash@duke.edu'})

asthma = Trial.create({trialName: 'Asthma', trialID: 123, startDate: Date.new(2012, 6, 1), endDate: Date.new(2013, 12, 31), enrolledGoal: 400, completedGoal: 250, 

	entries_attributes: [{input_at: Date.new(2012, 6, 1), 
		enrolled: 51, 
		active: 24, 
		withdrawn: 22, 
		completed: 34, 
		refused: 21, 
		lost: 14},
		
{input_at: Date.new(2012, 6, 8),
enrolled: 72,
active: 23,
withdrawn: 30,
completed: 42,
refused: 24,
lost: 17},

{
input_at: Date.new(2012, 6, 15),
enrolled: 95,
active: 15,
withdrawn: 30,
completed: 50,
refused: 26,
lost: 20},

]})

asthma.users << sean
asthma.users << dan
asthma.users << ash

diabetes = Trial.create({trialName: 'Diabetes', trialID: 125, startDate: Date.new(2012, 6, 1), endDate: Date.new(2013, 12, 31), enrolledGoal: 400, completedGoal: 250, 

	entries_attributes: [{input_at: Date.new(2012, 6, 1), 
		enrolled: 51, 
		active: 24, 
		withdrawn: 22, 
		completed: 34, 
		refused: 21, 
		lost: 14},
		
{input_at: Date.new(2012, 6, 8),
enrolled: 72,
active: 23,
withdrawn: 30,
completed: 42,
refused: 24,
lost: 17},

{
input_at: Date.new(2012, 6, 15),
enrolled: 95,
active: 15,
withdrawn: 30,
completed: 50,
refused: 26,
lost: 20},

]})

diabetes.users << dan


cancer = Trial.create({trialName: 'Cancer', trialID: 124, startDate: Date.new(2012, 6, 1), endDate: Date.new(2013, 12, 31), enrolledGoal: 400, completedGoal: 250,
	entries_attributes: [{input_at: Date.new(2012, 6, 1), 
		enrolled: 51, 
		active: 24, 
		withdrawn: 22, 
		completed: 34, 
		refused: 21, 
		lost: 14},
		
{input_at: Date.new(2012, 6, 8),
enrolled: 72,
active: 23,
withdrawn: 30,
completed: 42,
refused: 24,
lost: 17},

{
input_at: Date.new(2012, 6, 15),
enrolled: 95,
active: 15,
withdrawn: 30,
completed: 50,
refused: 26,
lost: 20}

]})

cancer.users << ash 

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

# g4 = Entry.new
# g.input_at = Date.new(2012, 7, 19)
# g.enrolled = 186
# g.active = 21
# g.withdrawn = 74
# g.completed = 117
# g.refused = 54
# g.lost = 46
# g.save

# g3 = Entry.new
# g.input_at = Date.new(2012, 7, 26)
# g.enrolled = 203
# g.active = 16
# g.withdrawn = 77
# g.completed = 129
# g.refused = 61
# g.lost = 50
# g.save

# g2 = Entry.new
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




