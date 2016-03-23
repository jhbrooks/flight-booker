require 'test_helper'

class AirportTest < ActiveSupport::TestCase
  def setup
    @airport = airports(:one)
  end

  test "should be valid" do
    assert @airport.valid?
  end
end
