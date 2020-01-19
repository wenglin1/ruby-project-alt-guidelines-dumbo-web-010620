require 'database_cleaner'
DatabaseCleaner.clean_with(:truncation)

Festival.destroy_all 






###AVAILABLE_FESTIVALS
gmb = Festival.create(name: "Governers Ball Music festival 2020", location: "Governers Island, New York", budget: 250000, date: 2020)
cochella = Festival.create(name: "Cochella", location: "Indio, California", budget: 1200000, date:2020)
woodstock = Festival.create(name: "Woodstock 2020", location: "Woodstock, New York", budget: 600000, date:2020)
