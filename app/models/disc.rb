class Disc < ApplicationRecord
    belongs_to :bag, optional: true
    has_many :users, through: :bags

    validates :disc_name, presence: true
end
