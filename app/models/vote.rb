class Vote < ApplicationRecord
	belongs_to :comments
	belongs_to :votable, polymorphic: true
	belongs_to :voter, class_name: 'User', optional: true

	validates :votable, uniqueness: { scope: :user }

	def vote_sum
    votes.sum(:value)
  end
end
