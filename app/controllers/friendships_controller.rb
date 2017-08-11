class FriendshipsController < ApplicationController
  def create
    current_user.friendships.create!(friendship_params)
  end

  def destroy
    another_user = User.find params[:user_id]
    current_user.friends.delete(another_user)
  end

  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end
end
