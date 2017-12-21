class Post < ApplicationRecord
	has_many :comments, as: :commentable
	belongs_to :category, optional: true
	belongs_to :poster, class_name: 'User', optional: true
end
