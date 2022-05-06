class Bag < ApplicationRecord
    has_many :discs
    belongs_to :user
    validates :name, uniqueness: true, presence: true
    accepts_nested_attributes_for :discs, reject_if: :all_blank

    scope :belongs_to_user, -> (user_id) {where(user_id: user_id)}
end
