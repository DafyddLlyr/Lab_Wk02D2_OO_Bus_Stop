# Create a Bus class.

# The Bus should have a route number (e.g. 22) and a destination (e.g. "Ocean Terminal").

# The Bus should have a drive method that returns a string (e.g. "Brum brum").

# Give the Bus class a new property, 'passengers'. This should be an array, which starts off empty.

# Add a method to the Bus class which returns how many passengers are on the bus.

# Add a method to the Bus class which takes in a Person and adds it to the array of passengers. The method could look something like bus.pick_up(passenger1)

# Add a method that drops off a passenger and removes them from the array. This could look like bus.drop_off(passenger2)

# Add an 'empty' method to remove all of the passengers - this might be used when the bus reaches its destination, or if the bus breaks down. It should remove all of the passengers from the array.

require("minitest/autorun")
require("minitest/rg")
require_relative("../bus")
require_relative("../person")

class BusTest < MiniTest::Test

  def setup
    @bus = Bus.new("X32", "Aberystwyth")
    @passenger_1 = Person.new("Myfanwy", 79)
    @passenger_2 = Person.new("Einir", 91)
    @passenger_3 = Person.new("Heulwen", 78)
  end

  def test_route_number
    assert_equal("X32", @bus.route)
  end

  def test_destination
    assert_equal("Aberystwyth", @bus.destination)
  end

  def test_drive
    assert_equal("Brum brum", @bus.drive)
  end

  def test_passengers
    assert_equal([], @bus.passenger_list)
  end

  def test_passenger_numbers
    assert_equal(0, @bus.passenger_count)
  end

  def test_pick_up
    @bus.pick_up(@passenger_1)
    assert_equal(1, @bus.passenger_count)
    assert_equal([@passenger_1], @bus.passenger_list)
  end

  def test_drop_off
    @bus.pick_up(@passenger_1)
    @bus.pick_up(@passenger_2)
    @bus.pick_up(@passenger_3)
    @bus.drop_off(@passenger_2)
    assert_equal([@passenger_1, @passenger_3], @bus.passenger_list)
  end

  def test_empty
    @bus.pick_up(@passenger_1)
    @bus.pick_up(@passenger_2)
    @bus.pick_up(@passenger_3)
    @bus.empty
    assert_equal([], @bus.passenger_list)
  end

end
