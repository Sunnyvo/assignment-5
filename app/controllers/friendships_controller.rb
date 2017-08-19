class FriendshipsController < ApplicationController
  def create
    friendship = current_user.friendships.create!(friendship_params)
    @item = friendship.friend
    respond_to do |f|
      f.html {redirect_back(fallback_location: root_path)}
      f.js {render "add_friend"}
    end
  end

  def destroy
    another_user = User.find params[:user_id]
    current_user.friends.delete(another_user)
    @item = another_user
    respond_to do |f|
      f.html {redirect_back(fallback_location: root_path)}
      f.js {render "remove_friend"}
    end
  end

  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end
end
