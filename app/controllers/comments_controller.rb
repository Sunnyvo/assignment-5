class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
    else
      flash[:error] = "Error: #{@comment.errors.full_messages.to_sentence}"
    end
    @item = @comment.post
    puts "heelo"
    puts @item
    respond_to do |f|
      f.html{ redirect_back(fallback_location: root_path) }
      f.js { render 'comment' }
    end
    CommentMailer.notify_new_comment(@comment).deliver_later
  end

  private

  def comment_params
  params.require(:comment).permit(:body, :post_id)
  end
end
