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
            #self.duplicate_names(name)
        else
            sleep(0.2)
        puts "What is your name?"
            promoter_name = gets.chomp
            promoter_info = Promoter.create(name: promoter_name)
            App.wipe_screen
            self.promoter_menu
        end
    end

    def self.promoter_menu
        TTY::Prompt.new.select("what would you like to do?") do |menu_item|
            menu_item.choice "View my festivals", -> {self.pro_festivals}
            menu_item.choice "Start a festival", -> {Festival.new_festival}
            menu_item.choice "Take me back to the main menu", -> {App.end}
          end
    end

    def self.pro_festivals
        #if no festivals -> start_festival?
        #list all festivals with promoter attached
    end

    def self.start_festival?
        #puts"You have no festivals, would you like to create one?"
        #yes ->Festival.new_festival
        #no ->Promoter_menu
    end
    
end