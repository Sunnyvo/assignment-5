class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    post  = current_user.posts.build post_params
    if post.save
      flash[:success] = "I hear your soul"
    else
      flash[:error] = "Error: #{post.errors.full_messages.to_sentence}"
    end
    redirect_back(fallback_location: root_path)
  end


  private

  def post_params
    params.require(:post).permit(:waller_id,:body)
  end

  
end
