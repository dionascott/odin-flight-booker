class Flight < ApplicationRecord
  belongs_to :to_airport, class_name: 'Airport'
  belongs_to :from_airport, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings

  def formatted_dates
    start.strftime("%b %d, %Y")
  end

  def self.available_dates
    flights = all.order(start: :asc)
    flights.map { |f| f.start.strftime('%b %d, %Y') }.uniq
  end

  def self.available_flights(origin, destination, dept_date)
    where(from_airport_id: origin, to_airport_id: destination,
          start: Flight.parse_date(dept_date))
  end

  # Parse a string date into a range object representing the whole day
  def self.parse_date(date)
    datetime = date.to_datetime
    datetime.beginning_of_day..datetime.end_of_day
  end
end
