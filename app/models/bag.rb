class Bag < ApplicationRecord
    has_many :discs
    belongs_to :user
    validates :name, uniqueness: true
    # accepts_nested_attributes_for :discs, reject_if: proc { |attributes| attributes['plastic'].blank? || attributes['weight'].blank? }
    accepts_nested_attributes_for :discs, reject_if: :all_blank
end
