class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :set_current_user, only: %i[login]

  def index
    @users = User.all

    render json: { status: 200, data: @users }
  end

  def login
    if @current_user.length.positive?
      render json: { user: @current_user, status: 201 }
    else
      render json: { error: "User with username: #{params[:username]} not found", status: 400 }
    end
  end

  def show
    render json: { user: @user, status: 201 }
  end

  def create
    @user = User.new(user_params)
    @user.password = 'password'

    if @user.save
      render json: { status: 201, message: 'user created successfully', data: @user }
    else
      render json: { error: @user.errors.full_messages, status: 402 }
    end
  end

  def update
    @updated_user = @user.update!(user_params)

    if @updated_user
      render json: { data: @updated_user, message: 'user updated successfully!' }
    else
      render json: { error: @updated_user, status: 422 }
    end
  end

  def destroy
    @action = @user.destroy

    if @action
      render json: { message: 'User Deleted!' }
    else
      render json: { message: action.errors, status: :unprocessable_entity }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :username, :encrypted_password, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_current_user
    @current_user = User.where(username: params[:username])
  end
end
