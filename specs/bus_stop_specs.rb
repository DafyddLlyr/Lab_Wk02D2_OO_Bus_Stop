# Create a new class called BusStop. This should have a name attribute.

# Add an attribute to the BusStop called 'queue'. This should be an empty array that will get filled with instances of the Person class.

# Add a method that adds a person to the queue.

# Now imagine that our bus is travelling along the route. For now we will imagine that there is only one bus that goes on this route, so every passenger waiting at each stop wants to get on the bus.


# Try writing a method that the bus would call, to collect all of the passengers from a stop. This might look like bus.pick_up_from_stop(stop1). This should take all of the passengers waiting in line at the stop, and put them inside of the bus. So the stop will now have nobody in the queue, and the number of people on the bus will increase by however many people the stop had at it.

require("minitest/autorun")
require("minitest/rg")
require_relative("../bus_stop")
require_relative("../person")

class BusStopTest < MiniTest::Test

  def setup
    @bus_stop = BusStop.new("Machynlleth")
    @passenger_1 = Person.new("Myfanwy", 79)
    @passenger_2 = Person.new("Einir", 91)
    @passenger_3 = Person.new("Heulwen", 78)
  end

  def test_name
    assert_equal("Machynlleth", @bus_stop.name)
  end

  def test_queue
    assert_equal([], @bus_stop.queue)
  end

  def test_add_to_queue
    @bus_stop.add_to_queue(@passenger_1)
    @bus_stop.add_to_queue(@passenger_2)
    @bus_stop.add_to_queue(@passenger_3)
    assert_equal([@passenger_1, @passenger_2, @passenger_3], @bus_stop.queue)
  end

end
