# Create a Person class.

# The Person class should have attributes of a name and age.


require("minitest/autorun")
require("minitest/rg")
require_relative("../person")

class PersonTest < MiniTest::Test

  def setup
    @person = Person.new("Dai", 82)
  end

  def test_name
    assert_equal("Dai", @person.name)
  end

  def test_age
    assert_equal(82, @person.age)
  end

end
