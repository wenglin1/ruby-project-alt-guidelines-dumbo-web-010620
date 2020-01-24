class Dj < ActiveRecord::Base
    has_many :play_sets
    has_many :festivals, through: :play_sets
end