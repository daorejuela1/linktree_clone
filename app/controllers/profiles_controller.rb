class ProfilesController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Succesfully added"
    else
      render :new
    end
  end

  def show
    @user = User.find_by(username: params[:username])
  end

  def edit
    @user = User.find_by(username: params[:username])
  end

  def update
    @user = User.find_by(username: params[:username])
    if @user.update(user_params)
      redirect_to root_path, notice: "Updated succesfully"
    else
      render :edit
    end
  end

  def delete
    @user = User.find_by(username: params[:username])
    if @user.delete
      redirect_to root_path, notice: "Deleted succesfully"
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :username, :avatar, :bio, :twitter, :facebook, :instagram)
  end
end
