class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @dates = Flight.available_dates

    if params[:commit]
      @from_airport = params[:from_airport]
      @to_airport = params[:to_airport]
      @day = params[:start]
      @flights = Flight.available_flights(@from_airport, @to_airport, @day)
      @passenger_number = params[:passengers]
      if @flights.any?
        flash.now[:success] = "#{@flights.count} records found."
      else
        flash.now[:alert] = "No records found. Please try again."
      end
      render 'index'
    else
      #flash.now[:notice] = "Input the options for your search below."
      render 'index'
    end
  end


  private

    def passenger_number_params
      params.require(:flights).permit(:passenger_number)
    end

    def flight_params
      params.require(:flights).permit(:start, :from_airport_id, :to_airport_id)
    end
end
