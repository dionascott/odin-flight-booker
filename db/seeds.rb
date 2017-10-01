Airport.delete_all
Flight.delete_all

first = Airport.create!(name: "SFO")
second = Airport.create!(name: "NYC")

Flight.create!(start: 2.days.from_now, flight_duration: 1200,
               from_airport_id: first.id, to_airport_id: second.id)
Flight.create!(start: 3.days.from_now, flight_duration: 1200,
               from_airport_id: second.id, to_airport_id: first.id)
Flight.create!(start: 4.days.from_now, flight_duration: 1200,
               from_airport_id: first.id, to_airport_id: second.id)
Flight.create!(start: 2.days.from_now, flight_duration: 1200,
              from_airport_id: second.id, to_airport_id: first.id)
Flight.create!(start: 3.days.from_now, flight_duration: 1200,
              from_airport_id: first.id, to_airport_id: second.id)
Flight.create!(start: 4.days.from_now, flight_duration: 1200,
              from_airport_id: second.id, to_airport_id: first.id)
Flight.create!(start: 2.days.from_now, flight_duration: 1200,
               from_airport_id: first.id, to_airport_id: second.id)
Flight.create!(start: 3.days.from_now, flight_duration: 1200,
               from_airport_id: second.id, to_airport_id: first.id)
Flight.create!(start: 4.days.from_now, flight_duration: 1200,
             from_airport_id: second.id, to_airport_id: first.id)
