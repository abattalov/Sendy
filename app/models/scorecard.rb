class Scorecard < ApplicationRecord
    validates :course, :date, :strokes, :score, presence: true
end
