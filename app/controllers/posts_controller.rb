class PostsController < ApplicationController
    #loged in user can create, edit , delete posts
  before_action :authenticate_user!, except: [:index, :show]
  # Loading the post before actions that need it  used filters
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # Only the post owner can edit or delete
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  
  def index
    if params[:search].present?
      @posts = Post.search(params[:search])
    else
      @posts = Post.all.order(created_at: :desc)
    end
  end


  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def new
    @post = current_user.posts.new # current user creating new post
  end

  def create       # create post
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end  # edit is for only authorized handled by before_action 

  def update     # update the post  if valid
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy             # deleted the post and redirect to homepage
    @post.destroy
    redirect_to root_path, notice: "Post deleted successfully."
  end

  private

  def set_post
    @post = Post.find(params[:id])   # find the post by ID
  end

  def authorize_user!        #redirect if current user is not the post owner
    redirect_to root_path, alert: "Not authorized." unless @post.user == current_user
  end

  def post_params
     # Only allow title and content to be submitted
    params.require(:post).permit(:title, :content)
  end
end

