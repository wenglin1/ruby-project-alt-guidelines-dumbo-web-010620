class Festival < ActiveRecord::Base
    has_many :play_sets
    has_many :djs, through: :play_sets

    def self.menu
        TTY::Prompt.new.select("Hi! Would you like to log in or create a festival?") do |menu|
            menu.choice "I am a new festival", -> {self.new_user}
            menu.choice "Nope, I'm about that festival life", -> {self.user_return}
            menu.choice "Take me back to the main menu", -> {App.end}
          end
    end

    def new_user
        #request login informtion
        #if user already exists, then puts "user already exists"and send to user_return
        #else, create new festival instance by name
        #run festival_info method
    end

    def user_return
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
        self.all.map do |fest|
            fest.name
        end
    end
    
end