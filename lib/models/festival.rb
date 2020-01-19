class Festival < ActiveRecord::Base
    has_many :play_sets
    has_many :djs, through: :play_sets

    def self.get_full_list
        self.all.map do |fest|
            fest.name
        end
    end
    
end