class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create(user_params)
    @post  = current_user.text_post.build user_params
    if @post.save
      flash[:success] = "I hear your soul"
    else
      flash[:error] = "Error: #{@message.errors.full_messages.to_sentence}"
    end
    redirect_to post_path
  end


  private

  def user_params
    params.require(:post).permit(:id_user, :text_post)
  end

end
