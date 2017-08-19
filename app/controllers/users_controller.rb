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
    login(@user)
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to root_path
  end

  def index
    if params[:search]
      @users = User.where("name ILike ?","%#{params[:search]}%")
    else
      @users = User.all
    end
  end

  def show
    @user = User.find_by(id: params[:id] )
    @post = Post.new
    @comment = Comment.new
  end

  def friends
    @users= current_user.friends
  end

  def friendedby
    @users = Friendship.where(friend: current_user).map {|e| e.user}
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :avatar)
  end
end
