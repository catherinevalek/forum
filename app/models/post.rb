class Post < ApplicationRecord
	has_many :comments, as: :commentable
	has_many :votes, as: :votable 
	belongs_to :category, optional: true
	belongs_to :poster, class_name: 'User', optional: true
end
