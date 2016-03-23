class Airport < ActiveRecord::Base
  has_many :departing_flights, foreign_key: :from_id,
                               inverse_of: :from_airport,
                               class_name: "Flight"
  has_many :arriving_flights, foreign_key: :to_id,
                              inverse_of: :to_airport,
                              class_name: "Flight"
end
