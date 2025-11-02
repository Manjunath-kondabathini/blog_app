class CommentsController < ApplicationController
  before_action :authenticate_user!          # logged-in users can create comments.

  def create
    @post = Post.find(params[:post_id])    # find the comment using post id
    @comment = @post.comments.build(comment_params)        
    @comment.user = current_user

    # saving the comment in databse
    if @comment.save
      redirect_to @post, notice: "Comment added."
    else
      redirect_to @post, alert: "Comment could not be saved."
    end
  end

  private
  
  # Strong parameters: only allow the body field to be submitted

  def comment_params
    params.require(:comment).permit(:body)
  end
end