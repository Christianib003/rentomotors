class Api::V1::UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @users = User.all

    render json: {status: 200, data: @users}
  end

  def show
  end

  def create
    @user = User.new

    @user.name = params[:name]
    @user.username = params[:username]
    @user.password = params[:password]
    @user.email = params[:email]

      if @user.save
        render json: { status: 201, message: 'user created successfully', data: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
  end

  def update
  end

  def destroy
  end

  # private

  # # Only allow a list of trusted parameters through.
  # def user_params
  #   params.require(:user).permit(:name, :username, :password, :email)
  # end
end
