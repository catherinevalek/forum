class HomeController < ApplicationController
  def index
  	@categories = Category.all
  	# @trending = Post.order(votes.sum(:value)).limit(5)
  	# @trending = Vote.joins(:posts).group("votes.id").order("count(votes.id) DESC")
@trending = Post.joins(:votes)
  .group("posts.id, votes.value")
  .having("votes.value > ?", 0)
  .order("votes.value desc")
  .where(created_at: 3.months.ago..Time.zone.now.to_date)
  .limit(10)
  # .page(params[:page])
  # .per_page(72)
    # render :index
    # binding.pry
  end
end
