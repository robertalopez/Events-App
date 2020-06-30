# Users Controller
# t.string "username"
# t.string "password"
# t.text "bio"
# t.string "profile_picture"
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false

class UsersController < ApplicationController
  def index
    @users = User.all 
  end

  def show
    current_user
  end

  def new
    @user = User.new 
  end

  def create
    user = User.new(user_params)
    user.save 
    redirect_to user_path(user)
  end

  def edit
    current_user
  end

  def update
    @user.update(user_params)
  end

  def destroy
    current_user
    @user.destroy 
  end

  private 

  def user_params 
    params.require(:user).permit(:username, :password, :bio, :profile_picture)
  end 

  def current_user
    @user = User.find(params[:id])
  end
end
