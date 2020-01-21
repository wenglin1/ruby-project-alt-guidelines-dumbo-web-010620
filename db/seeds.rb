require 'database_cleaner'
DatabaseCleaner.clean_with(:truncation)

Festival.destroy_all 

###DJs
rl_grime = Dj.create(name: "RL Grime", genre: "Trap", rate: 85000)
illenium = Dj.create(name: "Illenium", genre: "Future Bass", rate: 90000)
slander = Dj.create(name: "Slander", genre: "Dubstep", rate: 80000)
dabin = Dj.create(name: "Dabin", genre: "Future Bass", rate: 40000)
said_the_sky = Dj.create(name: "Said the Sky", genre: "Future Bass", rate: 50000)
yellow_claw = Dj.create(name: "Yellow Claw", genre: "Trap", rate: 70000)
<<<<<<< HEAD
zedd = Dj.create(name: "Zedd", genre: "pop", rate: 120000)
=======
zedd = Dj.create(name: "Pop", genre: "pop", rate: 120000)

>>>>>>> a58a8962dcb5f1a4e8442ce03a3a5c60e3eaaf30



###AVAILABLE_FESTIVALS
gmb = Festival.create(name: "Governers Ball Music festival 2020", location: "Governers Island, New York", budget: 1500000, date: 'May 05, 2020', promoter: "Avi Blum")
cochella = Festival.create(name: "Coachella", location: "Indio, California", budget: 1200000, date:'April 30, 2020', promoter: "James Dolan")
woodstock = Festival.create(name: "Woodstock 2020", location: "Woodstock, New York", budget: 600000, date:'March 6, 2020', promoter: "Metallica")

