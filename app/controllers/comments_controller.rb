class CommentsController < ApplicationController
	before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params
    @comment.commenter = current_user

    if @comment.save
      redirect_back(fallback_location: root_path, notice: 'Your comment was successfully posted!') 
    else
      redirect_back(fallback_location: root_path, notice: "Your comment wasn't posted!")
    end
  end

  def index
		@comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def upvote
    @comment = Comment.find(params[:id])
    @comment.votes.create(value: 1, votable: @comment, voter: current_user)
    redirect_to @comment
  end

  def downvote
    @comment = Comment.find(params[:id])
    @comment.votes.create(value: -1, votable: @comment, voter: current_user)
    redirect_to @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
  end
end
