class Vote < ApplicationRecord

	belongs_to :votable, polymorphic: true
	belongs_to :comments, optional: true
	belongs_to :voter, class_name: 'User', optional: true
  # belongs_to :posts, optional:true
	# validates :post, uniqueness: { scope: :user }
	# validates :question, uniqueness: { scope: :user }
	validates :commentable, uniqueness: { scope: :user }

end
