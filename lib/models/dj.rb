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
        if Dj.find_by(name: name)
            #self.duplicate_names(name)
        else
            sleep(0.2)
        puts "What genre of electronic dance music do you play?"
            dj_genre = gets.chomp
        puts "What is your hiring rate?"
            dj_rate = gets.chomp.to_i
            dj_info = Dj.create(name: name, genre: dj_genre, rate: dj_rate)
            App.wipe_screen
            self.dj_menu
        end
        #request login informtion
        #if user already exists, then puts "user already exists"and send to user_return
        #else, create new dj instance by name
        #run dj_info method
    end

    def self.user_return
        puts "Enter your login information"
        name = gets.chomp
          if !Dj.find_by(name: name)
              self.reject_input
          else
              dj_info = Dj.find_by(name: name)
              self.dj_menu
          end
        #allow user to log in with previous information
        #run dj_menu method
    end

    def self.dj_menu
        #tty prompt menu
        #options--Current sets/Book a set/Cancel account
        #current_sets.item -> all_sets(owned by dj)
        #book_set.item -> new_set
        #cancel_account.item -> destroy_dj
        #exit- goes back to main menu
    end

    def self.reject_input
        puts "Sorry, that name does not exist in our system, please try again"
        self.user_return
    end


    def self.all_festivals
         djs = Festival.all.map do |festival|
          festival.name
        end
        festival_name = TTY::Prompt.new.select("Here are all the available Festivals. Select one for more details:", dj)
        festival_info = Festival.find_by(name: festival_name)
    end
end