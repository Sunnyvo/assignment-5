class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post  = current_user.posts.build post_params
    if @post.save
      flash[:success] = "I hear your soul"
    else
      flash[:error] = "Error: #{@message.errors.full_messages.to_sentence}"
    end
    redirect_back(fallback_location: 'something')
  end


  private

  def post_params
    params.require(:post).permit(:waller_id,:body)
  end

end
