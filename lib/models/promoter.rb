class Promoter <ActiveRecord::Base
    has_many :festivals

    def self.menu
        TTY::Prompt.new.select("Hi! Are you a new promoter or a returning user?") do |menu_item|
            menu_item.choice "I am a new promoter", -> {self.new_user}
            menu_item.choice "I already promote festivals", -> {self.user_return}
            menu_item.choice "Take me back to the main menu", -> {App.end}
          end
    end
    
    def self.new_user
        puts "What is your name?"
        name = gets.chomp
        if Promoter.find_by(name: name)
            self.no_repeat(name)
        else
            sleep(0.2)
            promoter_name = name
            promoter_info = Promoter.create(name: promoter_name)
            App.wipe_screen
            self.promoter_menu(promoter_menu)
        end
    end

    def self.user_return
        puts "Welcome back! Enter your login information"
        name = gets.chomp
        # call .wrong_input method if cannot find the name, otherwise call .main_menu
          if !Promoter.find_by(name: name)
              #self.reject_input
          else
            promoter_info = Promoter.find_by(name: name)
              self.promoter_menu(promoter_info)
          end
        #allow user to log in with previous information
        #run festival_menu method
    end

    def self.new_festival(promoter_info)
        sleep(0.2)
    puts "What would you like to call your festival?"
        festival_name = gets.chomp
    puts "What is your budget for your festival? please enter in numbers in the following format :1234)"
        festival_budget = gets.chomp.to_i
    puts "Where would you like to have #{festival_name}?"
        festival_loc = gets.chomp
    puts "When would you like to have #{festival_name} - (Please enter in Mar, 00, 0000 format)?"
        date = gets
        festival_info = Festival.create(promoter_id: self, name: festival_name, location: festival_loc, budget:festival_budget, date: date)
        App.wipe_screen
        self.promoter_menu(promoter_info)
end
    
    def self.promoter_menu(promoter_info)
        TTY::Prompt.new.select("what would you like to do?") do |menu_item|
            menu_item.choice "View my festivals", -> {self.pro_festivals(promoter_info)}
            menu_item.choice "Start a festival", -> {self.new_festival(promoter_info)}
            menu_item.choice "Cancel a festival", -> {self.delete_festival(promoter_info)}
            menu_item.choice "Take me back to the main menu", -> {App.end}
          end
    end

    def self.pro_festivals(promoter_info)
        if promoter_info.festivals == []
            puts "you dont have any festivals"
        else
           return  promoter_info.festivals
        end
        
        #if no festivals -> start_festival?
        #list all festivals with promoter attached
    end

    def self.no_repeat(name)
         puts "Oops, that name is already taken in our app. Try using another name, something like #{name}2020 or #{name}_zhdks."
         self.new_user
    end
    

end