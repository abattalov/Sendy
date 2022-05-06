class Scorecard < ApplicationRecord
    validates :course, :date, :strokes, :score, presence: true
    belongs_to :user

    scope :order_by_date, -> {order(:date)}
end
