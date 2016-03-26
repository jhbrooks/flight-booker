require 'test_helper'

class FlightsIndexTest < ActionDispatch::IntegrationTest
  def setup
    @flight_two = flights(:two)
    @flight_three = flights(:three)
  end

  test "should display search form with dropdowns" do
    get root_path

    assert_select "title", text: full_title
    assert_select "h1", text: "Flights"

    assert_select "select#from_id", count: 1
    assert_select "select#to_id", count: 1
    assert_select "select#start", count: 1
    assert_select "select#num_passengers", count: 1
  end

  test "should display results including those slightly past midnight" do
    get root_path, from_id: @flight_two.from_id,
                   to_id: @flight_two.to_id,
                   start: parsable_start_date(@flight_two.start)

    assert_select "select#from_id", count: 1
    assert_select "select#to_id", count: 1
    assert_select "select#start", count: 1
    assert_select "select#num_passengers", count: 1

    assert_select "input[name=flight_id]", count: 2

    assert_match @flight_two.from_airport.code, response.body
    assert_match @flight_two.to_airport.code, response.body
    assert_match formatted_start_time(@flight_two.start), response.body
    assert_match formatted_duration(@flight_two.duration), response.body

    # Slightly past midnight (earlier than 3am on the next day)
    assert_match @flight_three.from_airport.code, response.body
    assert_match @flight_three.to_airport.code, response.body
    assert_match formatted_start_time(@flight_three.start), response.body
    assert_match formatted_duration(@flight_three.duration), response.body

    assert_select "input[name=num_passengers]", count: 1
  end
end
