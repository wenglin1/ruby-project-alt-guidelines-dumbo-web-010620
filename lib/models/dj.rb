class Dj < ActiveRecord::Base
    has_many :play_sets
    has_many :festivals, through: :play_sets
   
    
#*******************MENUS********************
#*******************************************
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
            self.dj_menu(dj_info)
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
              self.dj_menu(dj_info)
          end
        #allow user to log in with previous information
        #run dj_menu method
    end

    def self.dj_menu(dj_info)
        puts "Welcome back,#{dj_info.name}"
        TTY::Prompt.new.select("Please choose from one of the following options") do |menu_item|
            menu_item.choice "View my sets", -> {self.all_sets(dj_info)}
            menu_item.choice "Book a set", -> {self.book_set(dj_info)}
            menu_item.choice "Delete Account", -> {self.destroy_dj(dj_info)}
            menu_item.choice "Exit", -> {App.end}
        end
    end

#**************************************
#**************HELPERS******************
#***************************************
    def self.reject_input
        puts "Sorry, that name does not exist in our system, please try again"
        self.user_return
    end

    def self.all_sets(dj_info)
        sets = PlaySet.all.select do |n|
            n.dj_id == dj_info.id
        end
            sets.each_with_index do |n, i|
            puts "#{1 + i}. Duration -#{n.duration}"
        end
        sleep(2.0)
        self.dj_menu(dj_info)
        #map list of available sets not belonging to the dj
    end

    def self.destroy_dj(dj_info)
        self.destroy(dj_info.id)
        sleep (0.02)
        App.end
    end

    def book_set
        #self.set_select- an array
        #take array and use items to form selectable menu
        #attach dj to a set if dj does not have set booked during designated time
    end

    def end_account(dj_info)
        self.destroy(dj_info.id)
        sleep (0.02)
        App.end
    end
end