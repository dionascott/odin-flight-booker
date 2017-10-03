class PassengerMailer < ApplicationMailer
  default from: 'noreply@flightbooker.com'

  def thank_you(booking)
    @booking = booking
    @flight = @booking.flight
    @url = booking_url(@booking)
    mail( to: @booking.passengers.pluck(:email), subject: 'Your ticket has been booked.')
  end

  def self.send_thank_you(booking)
    @booking = booking
    if @booking.passengers.many?
      @users = @booking.passengers
      @users.each do |recipient|
        thank_you()
      end
    else
      thank_you(@booking)
    end
  end
end
