class Comment < ApplicationRecord
	belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  has_many :votes, as: :votable 
  belongs_to :commenter, class_name: 'User', optional: true
  include PgSearch
  multisearchable :against => :body
end
