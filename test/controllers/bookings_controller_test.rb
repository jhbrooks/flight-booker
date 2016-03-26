require 'test_helper'

class BookingsControllerTest < ActionController::TestCase
  def setup
    @flight = flights(:one)
    @booking = bookings(:one)
  end

  test "should get new" do
    get :new, flight_id: @flight
    assert_response :success
  end

  test "should post create" do
    post :create, flight_id: @flight,
      booking: { passengers_attributes: { "0" => { name: "a",
                                                   email: "b@c.com" },
                                          "1" => { name: "e",
                                                   email: "f@g.com" } } }
    assert_response :redirect
  end

  test "should get show" do
    get :show, id: @booking
    assert_response :success
  end
end
