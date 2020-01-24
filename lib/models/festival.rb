class Festival < ActiveRecord::Base
    has_many :play_sets
    has_many :djs, through: :play_sets
end