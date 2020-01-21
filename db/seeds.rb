require 'database_cleaner'
DatabaseCleaner.clean_with(:truncation)

Festival.destroy_all 






###AVAILABLE_FESTIVALS
gmb = Festival.create(name: "Governers Ball Music festival 2020", location: "Governers Island, New York", budget: 250000, date: 'May 05, 2020', promoter: "Avi Blum")
cochella = Festival.create(name: "Cochella", location: "Indio, California", budget: 1200000, date:'April 30, 2020', promoter: "James Dolan")
woodstock = Festival.create(name: "Woodstock 2020", location: "Woodstock, New York", budget: 600000, date:'March 6, 2020', promoter: "Metallica")
