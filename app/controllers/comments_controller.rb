class CommentsController < ApplicationController

  def create
    comment = current_user.comments.build comment_params
    if comment.save
      flash[:success] = "comment ok!"
    else
      flash[:error] = "Error: #{comment.errors.full_messages.to_sentence}"
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
  params.require(:comment).permit(:body, :post_id)
  end
end
