class HomeController < ApplicationController
  def index
    @post =Post.new
    @posts = Post.all.order("created_at DESC")
    @comment = Comment.new
  end
end
