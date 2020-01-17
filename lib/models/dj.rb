class DJ < ActiveRecord::Base
    has_many :sets
    has_many :festivals, through: :sets

end
