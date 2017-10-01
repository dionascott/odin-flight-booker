class BookingsController < ApplicationController
  before_action :check_flight_and_passengers, only: [:new]

  def new
    @flight = Flight.find_by(id: params[:flight_id])
    @booking = Booking.new

    passenger_number = params[:passengers].to_i
    passenger_number.times { @booking.passengers.build }

  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:success] = "Booking created."
      redirect_to @booking
    else
      flash.now[:error] = "Nope"
      redirect_to root_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end

  def check_flight_and_passengers
    if params[:flight_id] && params[:passengers]
      true
    else
      flash[:alert] = "Please input number of passengers " +
                      "and/or your intended flight."
      redirect_to root_path
    end
  end
end
