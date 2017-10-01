class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.datetime  :start
      t.integer   :flight_duration
      t.integer   :from_airport_id
      t.integer   :to_airport_id

      t.timestamps
    end
  end
end
