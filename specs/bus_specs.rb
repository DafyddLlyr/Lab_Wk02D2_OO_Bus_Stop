# Create a Bus class.

# The Bus should have a route number (e.g. 22) and a destination (e.g. "Ocean Terminal").

# The Bus should have a drive method that returns a string (e.g. "Brum brum").

# Give the Bus class a new property, 'passengers'. This should be an array, which starts off empty.

# Add a method to the Bus class which returns how many passengers are on the bus.

# Add a method to the Bus class which takes in a Person and adds it to the array of passengers. The method could look something like bus.pick_up(passenger1)

# Add a method that drops off a passenger and removes them from the array. This could look like bus.drop_off(passenger2)

# Add an 'empty' method to remove all of the passengers - this might be used when the bus reaches its destination, or if the bus breaks down. It should remove all of the passengers from the array.

# Now imagine that our bus is travelling along the route. For now we will imagine that there is only one bus that goes on this route, so every passenger waiting at each stop wants to get on the bus.

# Try writing a method that the bus would call, to collect all of the passengers from a stop. This might look like bus.pick_up_from_stop(stop1). This should take all of the passengers waiting in line at the stop, and put them inside of the bus. So the stop will now have nobody in the queue, and the number of people on the bus will increase by however many people the stop had at it.

require("minitest/autorun")
require("minitest/rg")
require_relative("../bus")
require_relative("../person")
require_relative("../bus_stop")

class BusTest < MiniTest::Test

  def setup
    @bus = Bus.new("X32", "Aberystwyth")
    @passenger_1 = Person.new("Myfanwy", 79)
    @passenger_2 = Person.new("Einir", 91)
    @passenger_3 = Person.new("Heulwen", 78)
    @bus_stop = BusStop.new("Machynlleth")
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

  def test_pick_up_from_stop
    @bus_stop.add_to_queue(@passenger_1)
    @bus_stop.add_to_queue(@passenger_2)
    @bus_stop.add_to_queue(@passenger_3)
    @bus.pick_up_from_stop(@bus_stop)
    assert_equal([], @bus_stop.queue)
    assert_equal([@passenger_1, @passenger_2, @passenger_3], @bus.passenger_list)
  end


end
