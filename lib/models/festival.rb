class Festival < ActiveRecord::Base
    has_many :play_sets
    has_many :djs, through: :play_sets

    def self.menu
        TTY::Prompt.new.select("Hi! Would you like to log in or create a festival?") do |menu|
            menu.choice "I am a new festival", -> {self.handle_new_user}
            menu.choice "Nope, I'm about that festival life", -> {self.handle_returning_user}
            menu.choice "Take me back to the main menu", -> {App.end}
          end
    end

    def self.get_full_list
        self.all.map do |fest|
            fest.name
        end
    end
    
end