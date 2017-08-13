class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post  = current_user.post.build post_params
    if @post.save
      flash[:success] = "I hear your soul"
    else
      flash[:error] = "Error: #{@message.errors.full_messages.to_sentence}"
    end
    redirect_back(fallback_location: 'something')
  end


  private

  def post_params
    params.require(:post).permit(:user_id, :text_post)
  end

end
