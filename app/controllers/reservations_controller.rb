class ReservationsController < ApplicationController

  def new 
    @philosopher = Philosopher.find(params[:philosopher_id])
    @reservation = Reservation.new()
  end

  def create
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    @philosopher = Philosopher.find(params[:philosopher_id])
    @reservation.philosopher = @philosopher
    @reservation.user = @user
    if @reservation.save
      redirect_to philosophers_path
    else
      redirect_to philosopher_path(@reservation.philosopher)
    end
  end





  def index
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :address)
  end

end
