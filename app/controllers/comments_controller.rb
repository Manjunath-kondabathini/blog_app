class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(comment_params.merge(user: current_user))

    if comment.save
      redirect_to post, notice: 'Comment added.'
    else
      redirect_to post, alert: 'Comment could not be saved.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
