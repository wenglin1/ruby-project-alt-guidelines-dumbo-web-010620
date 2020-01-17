class Festival < ActiveRecord::Base
    has_many :sets
    has_many :dj, through: :sets

end