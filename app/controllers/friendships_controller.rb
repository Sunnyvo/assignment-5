class FriendshipsController < ApplicationController
  def create
    current_user.friendships.create!(friendship_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    another_user = User.find params[:user_id]
    current_user.friends.delete(another_user)
    redirect_back(fallback_location: root_path)
  end

  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end
end
