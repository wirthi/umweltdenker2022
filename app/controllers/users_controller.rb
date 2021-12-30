class UsersController < ApplicationController
  def new
    @User = User.new
  end

  def show
    @user = User.find(params[:id])
  end
end
