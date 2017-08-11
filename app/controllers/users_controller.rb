class UsersController < ApplicationController
  before_action :require_login, only: [:index]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "User created."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to root_path
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id] )
  end

  def friends
    @users = []
    if params[:relate] == "fb"
      friendships = Friendship.where(friend: current_user )
      friendships.each do |friendship|
        puts friendship
        @users << User.find_by(id: friendship.user_id)
      end
    else
      friendships = Friendship.where(user: current_user)
      friendships.each do |friendship|
        puts friendship
        @users << User.find_by(id: friendship.friend_id)
      end
    end
  end




  private



  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
