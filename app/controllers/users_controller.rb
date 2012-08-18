class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account created successfully"
      redirect_to home_path
    else
      render :new
    end
  end
end
