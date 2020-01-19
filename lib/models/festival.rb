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
        #options--festival names
        #hire a dj
        #change festival info
        #exit- goes back to main menu
    end

    def self.get_full_list
        self.all.map do |fest|
            fest.name
        end
    end
    
end