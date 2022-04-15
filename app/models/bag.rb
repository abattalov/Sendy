class Bag < ApplicationRecord
    has_many :discs
    belongs_to :user

end
