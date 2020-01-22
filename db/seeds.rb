require 'database_cleaner'
DatabaseCleaner.clean_with(:truncation)

Festival.destroy_all 
Dj.destroy_all
Promoter.destroy_all



##AVAIABLE PROMOTERS
p1 = Promoter.create(name: 'Avi Blum')
p2 = Promoter.create(name: 'James')
p3 = Promoter.create(name: 'Jeremy')
p4 = Promoter.create(name: 'Arthur')
p5 = Promoter.create(name: 'Method 0')

###DJs
rl_grime = Dj.create(name: "RL Grime", genre: "Trap", rate: 85000)
illenium = Dj.create(name: "Illenium", genre: "Future Bass", rate: 90000)
slander = Dj.create(name: "Slander", genre: "Dubstep", rate: 80000)
dabin = Dj.create(name: "Dabin", genre: "Future Bass", rate: 40000)
said_the_sky = Dj.create(name: "Said the Sky", genre: "Future Bass", rate: 50000)
yellow_claw = Dj.create(name: "Yellow Claw", genre: "Trap", rate: 70000)
zedd = Dj.create(name: "Pop", genre: "pop", rate: 120000)




###AVAILABLE_FESTIVALS
gmb = Festival.create(name: "Governers Ball Music festival 2020", location: "Governers Island, New York", budget: 1500000, date: 'May 05, 2020', promoter: p4)
cochella = Festival.create(name: "Coachella", location: "Indio, California", budget: 1200000, date:'May, 31, 2020', promoter: p1)
woodstock = Festival.create(name: "Woodstock 2020", location: "Woodstock, New York", budget: 600000, date:'March 6, 2020', promoter: p1)
summer_jam = Festival.create(name: "Summer Jam 2020", location: "East Rutherford, New Jersey", budget:675000, date: 'June 6, 2020', promoter:p1)
dance_frenzy = Festival.create(name: "Dance Party 2020", location: "TBD", budget: 1200000, date: 'September 30, 2020', promoter: p5)

