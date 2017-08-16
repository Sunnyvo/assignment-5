module PostsHelper
  def current_title_or_default
    post.title ? post.title : "no title"
  end

  def display_likers(post)
    post.likes.map{|like| like.name_or_email}.to_sentence
  end
end
