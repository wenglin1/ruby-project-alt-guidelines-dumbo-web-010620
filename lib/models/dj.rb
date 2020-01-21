class Dj < ActiveRecord::Base
    has_many :play_sets
    has_many :festivals, through: :play_sets
    
    def self.menu
        TTY::Prompt.new.select("Hi! Are you a new or returning DJ?") do |menu_item|
            menu_item.choice "I'm a new DJ", -> {self.new_user}
            menu_item.choice "Nope, I'm a returning DJ", -> {self.user_return}
            menu_item.choice "Take me back to the main menu", -> {App.end}
          end
    end

    def self.new_user
        puts "What is your name?"
            name = gets.chomp
        if Dj.find_by(name)
            #self.duplicate_names(name)
        else
            sleep(0.2)
        puts "What genre of electronic dance music do you play?"
            dj_genre = gets.chomp
        puts "What is your hiring rate?"
            dj_rate = gets.chomp
            App.wipe_screen
            self.festival_menu
        end
        #request login informtion
        #if user already exists, then puts "user already exists"and send to user_return
        #else, create new festival instance by name
        #run festival_info method
    end

    def self.user_return
        puts "Welcome back! Enter your login information"
        name = gets.chomp
        # call .wrong_input method if cannot find the name, otherwise call .main_menu
          if !Dj.find_by(name)
              self.wrong_input
          else
              dj_info = Dj.find_by(name)
              self.dj_menu
          end
        #allow user to log in with previous information
        #run festival_menu method
    end

    def self.d_menu
        self.all_dj
        #tty prompt menu
        #options--festival names, hire a dj, change festival info
        #festival names -> all_festivals
        #hire a dj -> all_dj's
        #change festival info -> change_info
        #exit- goes back to main menu
    end

    def all_djs
        #list all djs, if no djs puts "There are no djs, would you like to register one?"
        #new_dj 
        #exit -> dj_menu
    end



    def self.all_djs
         djs = self.all.map do |dj|
          dj.name == name.id
        end
        dj_name = TTY::Prompt.new.select("Here are all the available DJs. Select one for more details:", dj)
        dj_info = self.find_by(name)
    end
end