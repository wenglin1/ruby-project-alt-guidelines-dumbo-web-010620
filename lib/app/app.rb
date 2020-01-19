class App

    attr_accessor :festival, :dj, :prompt

    def initialize()
        @prompt = TTY::Prompt.new
    end 
#*****************APP LOAD SCREEN****************
    def welcome
        App.wipe_screen
        puts "Welcome"
        main_menu
    end

#*****************MAIN MENU**********************
    def main_menu
        answer = prompt.select("Are you a Tourist or a Tour Guide?") do |menu|
            menu.choice "Dj", -> {Dj.menu}
            menu.choice "Festival", -> {Festival.menu}
            menu.choice "Exit", -> {App.end}
        end
    end

#**************HELPER METHODS*******************
    def self.wipe_screen
        system 'clear'
    end

    def self.end
        
            puts "
                        THANKS FOR CHOOSING BOOK MATE".colorize(:light_yellow)
            puts "
                                SEE YOU SOON \u{1f44B}".colorize(:light_yellow)
            
    end
end