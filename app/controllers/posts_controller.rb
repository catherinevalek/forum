class PostsController < ApplicationController
  def index
		@posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  # before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
  # before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      log_in @post
      flash[:success] = "Account created!"
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @post = post.find(params[:id])
  end

  def update
    @post = post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Your changes have been updated!"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    post.find(params[:id]).destroy
    flash[:success] = "post deleted"
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:first_name, :last_name, :email, :host, :birthday, :phone_number, :password, :password_confirmation)
  end
end
