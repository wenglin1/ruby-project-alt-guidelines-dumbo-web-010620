class Festival < ActiveRecord::Base
    belongs_to :promoter
    has_many :play_sets
    has_many :djs, through: :play_sets

    def self.menu
        TTY::Prompt.new.select("Hi! Would you like to log in or create a festival?") do |menu_item|
            menu_item.choice "I am a new promoter", -> {self.new_user}
            menu_item.choice "Nope, I promote festivals", -> {self.user_return}
            menu_item.choice "Take me back to the main menu", -> {App.end}
          end
    end

    def self.new_festival
            sleep(0.2)
        puts "What would you like to call your festival?"
            festival_name = gets.chomp
        puts "What is your budget for your festival? please enter in numbers in the following format :1234)"
            festival_budget = gets.chomp.to_i
        puts "Where would you like to have #{festival_name}?"
            festival_loc = gets.chomp
        puts "When would you like to have #{festival_name}?"
            date = gets.chomp
            festival_info = Festival.create(name: festival_name, location: festival_loc, budget:festival_budget, date: date,promoter: name)
            App.wipe_screen
            self.festival_menu
        #request login informtion
        #if user already exists, then puts "user already exists"and send to user_return
        #else, create new festival instance by name
        #run festival_info method
    end

    def self.user_return
        puts "Welcome back! Enter your login information"
        name = gets.chomp
        # call .wrong_input method if cannot find the name, otherwise call .main_menu
          if !Festival.find_by(promoter: name)
              self.reject_input
          else
              festival_info = Festival.find_by(promoter: name)
              self.festival_menu
          end
        #allow user to log in with previous information
        #run festival_menu method
    end

    def self.reject_input
        puts "Sorry, that name does not exist in our system, please try again"
        self.user_return
    end

    def self.festival_menu
        self.get_djs
        #self.all_festivals
        #tty prompt menu
        #options--my_festivals, hire a dj, change festival info
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

    def method_name
        
        specific_promotor()
    end

    def specific_promotor(pro)
       promo = Festival.all.select do |variable_in|
            variable_in.promoter == pro
        end
    #    promo_name =  self.prompt.select("what's your name promotor")
       
    end



    def self.all_festivals
         festivals = self.all.map do |fest|
          fest.name
        end
        fest_name = TTY::Prompt.new.select("Here are all the festivals. Pick one to see more details:", festivals)
        fest_info = self.find_by(name: fest_name)
    end

    def self.get_djs
       djs =  Dj.all.map do |n|
            n.name
        end
        djs.each_with_index do |n, i|
            puts "#{1 + i}. #{n}"
        end
    end
    
end