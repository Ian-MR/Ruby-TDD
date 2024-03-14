require 'minitest/autorun'
require_relative 'money'

class Test < Minitest::Test
    #def test_franc_multiplication
    #    five = Franc.new(5)
    #    assert_equal(Franc.new(10), five.times(2)) 
    #    assert_equal(Franc.new(15), five.times(3))
    #end
    #def test_multiplication
    #    five = Dollar.new(5)
    #    assert_equal(Dollar.new(10), five.times(2)) 
    #    assert_equal(Dollar.new(15), five.times(3))
    #end
    def test_equality
        assert(Dollar.new(5) == Dollar.new(5))
        assert(!(Dollar.new(5) == Dollar.new(6)))
        assert(Franc.new(5) == Franc.new(5))
        assert(!(Franc.new(5) == Franc.new(6)))
        assert(!(Franc.new(5) == Dollar.new(5)))
    end
end