require 'test_helper'

class BookingsShowTest < ActionDispatch::IntegrationTest
  def setup
    @booking = bookings(:one)
    @flight_one = flights(:one)
  end

  test "should display booking information" do
    get booking_path(@booking)

    assert_select "title", text: full_title("Booking info")
    assert_select "h1", text: "Booking information"

    assert_select "h3", text: "Flight details"
    assert_match @flight_one.from_airport.code, response.body
    assert_match @flight_one.to_airport.code, response.body
    assert_match formatted_start_time(@flight_one.start), response.body
    assert_match formatted_duration(@flight_one.duration), response.body

    assert_select "h3", text: "Passengers"
    @booking.passengers.each do |p|
      assert_match p.name, response.body
      assert_match p.email, response.body
    end

    assert_select "a[href=?]", root_path, text: "Back to flights"
  end
end
