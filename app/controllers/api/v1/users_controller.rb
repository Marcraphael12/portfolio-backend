class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      # session[:user_id] = @user.id
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      render json: 'user not found'
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user
      user.destroy
    else
      render json: 'user not found'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
