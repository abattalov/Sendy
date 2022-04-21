class Disc < ApplicationRecord
    belongs_to :bag, optional: true
end
