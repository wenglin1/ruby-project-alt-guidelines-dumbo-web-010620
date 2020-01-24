class App

    attr_accessor :festival, :dj, :prompt

    def initialize()
        @prompt = TTY::Prompt.new
    end 
#*****************APP LOAD SCREEN****************
    def app_start
        welcome
        main_menu
    end

    def welcome
        clear
        puts "Welcome"
    end

#*****************MAIN MENU**********************

    def main_menu
        TTY::Prompt.new.select("Are you a Dj or a Festival?") do |menu|
            menu.choice "Dj", -> {login_dj_menu}
            menu.choice "Festival", -> {login_festival_menu}
            menu.choice "Exit"
        end
        clear
    end

#*******************MENUS********************

    def login_dj_menu
        TTY::Prompt.new.select("Hi! Are you a new or returning DJ?") do |menu|
            menu.choice "I'm a new DJ", -> {new_dj}
            menu.choice "Nope, I'm a returning DJ", -> {returning_dj}
            menu.choice "Take me back to the main menu", -> {main_menu}
        end
        clear
    end

    def new_dj
        puts "What is your name?"
            name = gets.chomp.downcase.capitalize
        if Dj.find_by(name: name)
        else
        sleep(0.2)
        puts "What genre of electronic dance music do you play?"
            dj_genre = gets.chomp.downcase.capitalize
        puts "What is your hiring rate?"
            dj_rate = gets.chomp.to_i
            @dj_info = Dj.create(name: name, genre: dj_genre, rate: dj_rate)
        end
        dj_menu
    end

    def returning_dj
        puts "Enter your login information"
        name = gets.chomp.downcase.capitalize
        if !Dj.find_by(name: name)
            reject_input
        else
            @dj_info = Dj.find_by(name: name)
        end    
        dj_menu
    end

    def dj_menu
        puts "Welcome back, #{@dj_info.name}"
        TTY::Prompt.new.select("Please choose from one of the following options") do |menu|
            menu.choice "View my sets", -> {self.all_sets}
            menu.choice "Book a set", -> {book_set}
            menu.choice "Delete Account", -> {self.destroy_dj}
            menu.choice "Exit", -> {good_bye}
        end
    end

#**************************************
#**************HELPERS******************
#***************************************
    def reject_input
        puts "Sorry, that name does not exist in our system, please try again"
        user_return
    end

    def all_sets
        sets = PlaySet.all.select do |n|
            n.dj_id == @dj_info.id
        end
        sets.each_with_index do |n, i|
            puts "#{1 + i}. Duration: #{n.duration} minutes at"
        end
        sleep(2.0)
        dj_menu
    #map list of available sets not belonging to the dj
    end

    def destroy_dj
        Dj.find(@dj_info.id).destroy
        sleep (0.02)
        main_menu
    end

    def book_set
    #set_select- an array
    #take array and use items to form selectable menu
    #attach dj to a set if dj does not have set booked during designated time
    end  
    
    def login_festival_menu
        TTY::Prompt.new.select("Hi! Would you like to log in or create a festival?") do |menu|
            menu.choice "I am a new festival", -> {new_festival}
            menu.choice "I have a festival", -> {returning_festival}
            menu.choice "Take me back to the main menu", -> {main_menu}
        end
    end

    def new_festival
        sleep(0.2)
        puts "What would you like to call your festival?"
        festival_name = gets.chomp
        puts "What is your budget for your festival? please enter in numbers in the following format :1234)"
        festival_budget = gets.chomp.to_i
        puts "Where would you like to have #{festival_name}?"
        festival_loc = gets.chomp
        puts "When would you like to have #{festival_name} - (Please enter in Mar, 00, 0000 format)?"
        date = gets
        @festival_info = Festival.create(name: festival_name, location: festival_loc, budget:festival_budget, date: date)
        clear
        festival_menu
    end


    def returning_festival
        puts "Welcome back! Enter your login information"
        name = gets.chomp
        if !Festival.find_by(name: name)
            reject_input
        else
            @festival_info = Festival.find_by(name: name)    
        end
        festival_menu
    end


    def festival_menu
        TTY::Prompt.new.select("Hi! Would you like to log in or create a festival?") do |menu|
            menu.choice "View sets", -> {get_sets}
            menu.choice "Create a set", -> {set_create}
            menu.choice "Cancel Festival", -> {destroy_festival}
            menu.choice "Take me back to the main menu", -> {main_menu}
        end
    end

    def set_create
        puts "How long would you like to make this set?"
        time = gets.chomp
        set_info = PlaySet.create(dj_id: 0,festival_id: @festival_info.id, duration: time)
        festival_menu
    end

    def reject_input
        puts "Sorry, that name does not exist in our system, please try again"
        main_menu
    end

    def get_sets
        play_sets =  PlaySet.all.select do |n|
            n.festival_id == @festival_info.id
        end
        play_sets.each_with_index do |n, i|
            puts "#{1 + i}. Set duration - #{n.duration} minutes"
        end
        festival_menu
    end

    def destroy_festival
        Festival.find(@festival_info.id).destroy
        sleep (0.02)
        main_menu
    end
#**************HELPER METHODS*******************
    def clear
        system 'clear'
    end

    def good_bye
        puts "
                    THANKS FOR STOPPING BY!!".colorize(:light_yellow)
        puts "
                            COME BACK AGAIN!! \u{1f44B}".colorize(:light_yellow)
        end
    end
