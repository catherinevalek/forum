class Vote < ApplicationRecord

	belongs_to :votable, polymorphic: true
	belongs_to :comments, optional: true
	belongs_to :voter, class_name: 'User', optional: true

	# validates :votable, uniqueness: { scope: :user }

end
