class Festival < ActiveRecord::Base
    has_many :play_sets
    has_many :djs, through: :play_sets

    def self.menu
        TTY::Prompt.new.select("Hi! Would you like to log in or create a festival?") do |menu_item|
            menu_item.choice "I am a new festival", -> {self.new_user}
            menu_item.choice "Nope, I'm about that festival life", -> {self.user_return}
            menu_item.choice "Take me back to the main menu", -> {App.end}
          end
    end

    def self.new_user
        puts "What is your name?"
        name = gets.chomp
        if Festival.find_by(promoter: name)
            self.handle_duplicate_names(name)
        else
            sleep(0.2)
        puts "What would you like to call your festival?"
            festival_budget = gets.chomp.to_i
            festival_info = Festival.create(promoter: name, budget: group_size)
            system 'clear'
            self.book_tour_menu(tourist_instance)
        end
        #request login informtion
        #if user already exists, then puts "user already exists"and send to user_return
        #else, create new festival instance by name
        #run festival_info method
    end

    def self.user_return
        puts "Welcome back! Enter you login information"
        name = gets.chomp
        # call .wrong_input method if cannot find the name, otherwise call .main_menu
          if !Festival.find_by(name: name)
              self.wrong_input
          else
              festival_info = Festival.find_by(name: name)
              self.returning_main_menu(festival_info)
          end
        #allow user to log in with previous information
        #run festival_menu method
    end

    def festival_menu
        #tty prompt menu
        #options--festival names, hire a dj, change festival info
        #festival names -> all_festivals
        #hire a dj -> all_dj's
        #change festival info -> change_info
        #exit- goes back to main menu
    end

    def all_festivals
        #list all owned festivals
        #if no owned festivals puts "You arent running any festivals, would you like to create one?"
        #new_festival 
        #exit -> festival_menu
    end



    def self.all_festivals
         festivals = self.all.map do |fest|
          fest.name
        end
        fest_name = TTY::Prompt.new.select("Here are all the tours. Pick one to see more details:", festivals)
        tour_info = self.find_by(name: fest_name)
    end
    
end