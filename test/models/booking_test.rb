require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  def setup
    @booking = bookings(:one)
  end

  test "should be valid" do
    assert @booking.valid?
  end

  test "flight_id should be present" do
    @booking.flight_id = nil
    assert_not @booking.valid?
  end

  test "flight should exist in the database" do
    @booking.flight_id = 42
    assert_not @booking.valid?
  end
end
