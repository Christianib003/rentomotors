class Api::V1::ReservationsController < ApplicationController
  before_action :set_user, only: %i[index show update destroy]
  before_action :set_reservation, only: %i[show update destroy]

  def index
    @reservations = @user.reservations

    render json: { status: 200, data: @reservations }
  end

  def show
    render json: { reservation: @reservation, status: 201 }
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.date = Date.new
    @reservation.reserved_from = Date.new
    @reservation.user = User.find(params[:user_id])
    @reservation.car = Car.find(params[:car_id])

    if @reservation.save
      render json: { status: 201, message: 'resevation created successfully', data: @reservation }
    else
      render json: { error: @reservation.errors.full_messages, status: 402 }
    end
  end

  def update; end

  def destroy
    @action = @reservation.destroy

    if @action
      render json: { message: 'Reservation Deleted!' }
    else
      render json: { message: @action.errors, status: :unprocessable_entity }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.require(:reservation).permit(:date, :reseved_at, :reserved_until, :user_id, :car_id)
  end

  def set_user
    @user = User.includes(:reservations).find(params[:user_id])
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
