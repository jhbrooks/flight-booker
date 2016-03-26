require 'test_helper'

class BookingsNewTest < ActionDispatch::IntegrationTest
  def setup
    @flight = flights(:one)
  end

  test "should display new form with multiple passengers" do
    get new_booking_path, flight_id: @flight.id, num_passengers: "2"

    assert_select "title", text: full_title("Book flight")
    assert_select "h1", text: "Book flight"

    assert_select "h3", text: "Passenger 1"
    assert_select "input[name=?]", "booking[passengers_attributes][0][name]"
    assert_select "input[name=?]", "booking[passengers_attributes][0][email]"

    assert_select "h3", text: "Passenger 2"
    assert_select "input[name=?]", "booking[passengers_attributes][1][name]"
    assert_select "input[name=?]", "booking[passengers_attributes][1][email]"
  end

  test "should handle an invalid submission" do
    get new_booking_path, flight_id: @flight.id, num_passengers: "2"
    assert_no_difference "Booking.count" do
      assert_no_difference "Passenger.count" do
        post new_booking_path, flight_id: @flight.id,
          booking: { passengers_attributes: { "0" => { name: "",
                                                       email: "b@c.com" },
                                              "1" => { name: "e",
                                                       email: "" } } }
      end
    end
    assert_template "bookings/new"
    assert_select "div#error_explanation", count: 2
    assert_select "div.field_with_errors"
  end

  test "should handle a valid submission" do
    get new_booking_path, flight_id: @flight.id, num_passengers: "2"
    assert_difference "Booking.count", 1 do
      assert_difference "Passenger.count", 2 do
        post_via_redirect new_booking_path, flight_id: @flight.id,
          booking: { passengers_attributes: { "0" => { name: "a",
                                                       email: "b@c.com" },
                                              "1" => { name: "e",
                                                       email: "f@g.com" } } }
      end
    end
    assert_template "bookings/show"
    assert_not flash.empty?
  end
end
