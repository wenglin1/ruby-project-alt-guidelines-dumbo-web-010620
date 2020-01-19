class Festival < ActiveRecord::Base
    has_many :sets
    has_many :djs, through: :sets

end