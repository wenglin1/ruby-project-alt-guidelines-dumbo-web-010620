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
        App.wipe_screen
        puts "Welcome"
    end

#*****************MAIN MENU**********************
    def main_menu
        answer = prompt.select("Are you a Dj or a  Festival?") do |item|
            item.choice "Dj", -> {Dj.menu}
            item.choice "Promoter", -> {Festival.menu}
            item.choice "Exit", -> {App.end}
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