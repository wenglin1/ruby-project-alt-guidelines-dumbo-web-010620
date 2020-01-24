require 'database_cleaner'
DatabaseCleaner.clean_with(:truncation)

Festival.destroy_all 
Dj.destroy_all
PlaySet.destroy_all


###DJs
rl_grime = Dj.create(name: "RL Grime", genre: "Trap", rate: 85000)
illenium = Dj.create(name: "Illenium", genre: "Future Bass", rate: 90000)
slander = Dj.create(name: "Slander", genre: "Dubstep", rate: 80000)
said_the_sky = Dj.create(name: "Said the Sky", genre: "Future Bass", rate: 50000)






###AVAILABLE_FESTIVALS
gmb = Festival.create(name: "GBMF", location: "Governers Island, New York", budget: 1500000, date: 'May 05, 2020')
cochella = Festival.create(name: "Coachella", location: "Indio, California", budget: 1200000, date:'May, 31, 2020')
woodstock = Festival.create(name: "Woodstock", location: "Woodstock, New York", budget: 600000, date:'March 6, 2020')
summer_jam = Festival.create(name: "Summer Jam", location: "East Rutherford, New Jersey", budget:675000, date: 'June 6, 2020')


s1 = PlaySet.create(dj_id: 2, festival_id: 1, duration: 105)
s2 = PlaySet.create(dj_id: 3, festival_id: 2, duration: 115)
s3 = PlaySet.create(dj_id: 1, festival_id: 3, duration: 95)
s4 = PlaySet.create(dj_id: 3, festival_id: 4, duration: 60)
s5 = PlaySet.create(dj_id: 4, festival_id: 4, duration: 70)
s6 = PlaySet.create(dj_id: 2, festival_id: 2, duration: 100)
s7 = PlaySet.create(dj_id: 2, festival_id: 4, duration: 80)
s8 = PlaySet.create(dj_id: nil, festival_id: 3, duration: 100)
s9 = PlaySet.create(dj_id: nil, festival_id: 2, duration: 30)
s10 = PlaySet.create(dj_id: 2, festival_id: 1, duration: 50)
s11 = PlaySet.create(dj_id: nil, festival_id: 3, duration: 100)
s12 = PlaySet.create(dj_id: 4, festival_id: 4, duration: 90)
s13 = PlaySet.create(dj_id: nil, festival_id: 2, duration: 90)
s14 = PlaySet.create(dj_id: 1, festival_id: 1, duration: 90)
s15 = PlaySet.create(dj_id: 3, festival_id: 4, duration: 90)