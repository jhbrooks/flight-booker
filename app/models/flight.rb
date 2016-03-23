class Flight < ActiveRecord::Base
  belongs_to :from_airport, foreign_key: :from_id,
                            inverse_of: :departing_flights,
                            class_name: "Airport"
  belongs_to :to_airport, foreign_key: :to_id,
                          inverse_of: :arriving_flights,
                          class_name: "Airport"
end
