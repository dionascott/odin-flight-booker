class RemovePassengerFromBooking < ActiveRecord::Migration[5.1]
  def change
    remove_reference :bookings, :passenger, foreign_key: true
  end
end
