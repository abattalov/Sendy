class Scorecard < ApplicationRecord
    validates :course, :date, :strokes, :score, presence: true
    belongs_to :user
end
