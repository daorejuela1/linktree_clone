class MainController < ApplicationController
  def index
    @user = User.all
  end
end
