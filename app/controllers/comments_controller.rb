class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(params[:comment].permit(:content))
    @comment.user_id = current_user_id
    @comment.post_id = @post.id

    if @comment.save
      redirect_to post_path
    else
      render 'new'

    end
  end
end
