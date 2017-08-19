class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @comment = Comment.new
    @post  = current_user.posts.build post_params
    if @post.save
      respond_to do |f|
        f.html{ redirect_back(fallback_location: root_path) }
        f.js { render 'post' }
      end
      PostMailer.notify_new_post(@post).deliver_later
      NotifySlack.new.notify_new_post(@post)
    else
      flash[:error] = "Error: #{@post.errors.full_messages.to_sentence}"
    end

  end


  private

  def post_params
    params.require(:post).permit(:waller_id,:body)
  end


end
