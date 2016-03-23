require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  def setup
    @flight = flights(:one)
  end

  test "should be valid" do
    assert @flight.valid?
  end
end
