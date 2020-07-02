# Users Controller
# t.string "username"
# t.string "password"
# t.text "bio"
# t.string "profile_picture"
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false

class UsersController < ApplicationController
  before_action :current_user, only: [:show, :edit, :destroy, :update] 
  #skip_before_action :current_user, only: [:index, :create]
  skip_before_action :authorized, only: [:new, :create]

  def index
    @users = User.all 
  end

  def show
  end

  def new
    @user = User.new 
  end

  def create
    @user = User.create(params.require(:user).permit(:username,        
    :password))
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated."
      redirect_to @user 
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
    end

    
  end

  def destroy
    @user.destroy 
    redirect_to '/welcome'
  end

  private 

  def user_params 
    params.require(:user).permit(:username, :password, :bio, :profile_picture)
  end 

  def current_user
    @user = User.find(session[:user_id])
  end
end
