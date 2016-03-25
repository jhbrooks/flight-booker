require 'test_helper'

class PassengerTest < ActiveSupport::TestCase
  def setup
    @passenger = passengers(:one)
  end

  test "should be valid" do
    assert @passenger.valid?
  end

  test "booking_id should be present" do
    @passenger.booking_id = nil
    assert_not @passenger.valid?
  end

  test "booking should exist in the database" do
    @passenger.booking_id = 42
    assert_not @passenger.valid?
  end

  test "name should be present" do
    @passenger.name = " "
    assert_not @passenger.valid?
  end

  test "email should be present" do
    @passenger.email = " "
    assert_not @passenger.valid?
  end
end
