class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:delete, :edit, :update]

  def new
    @user = User.new
    @user.networks.build
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Succesfully added'
    else
      render :new
    end
  end

  def show
    @user = User.find_by(username: params[:username])
    @color = %w[info primary secondary danger warning light dark]
  end

  def update
    #@user = User.find_by(username: params[:username])
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, notice: 'Updated succesfully'
    else
      render :edit
    end
  end

  def delete
    #@user = User.find_by(username: params[:username])
    @user = current_user
    redirect_to root_path, notice: 'Deleted succesfully' if @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :avatar, :description, networks_attributes: %i[id link _destroy])
  end
end
