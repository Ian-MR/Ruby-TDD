require 'minitest/autorun'
require_relative 'dollar'
require_relative 'franc'

class Test < Minitest::Test
    def test_franc_multiplication
        five = Franc.new(5)
        assert_equal(Franc.new(10), five.times(2)) 
        assert_equal(Franc.new(15), five.times(3))
    end
    #def test_multiplication
    #    five = Dollar.new(5)
    #    assert_equal(Dollar.new(10), five.times(2)) 
    #    assert_equal(Dollar.new(15), five.times(3))
    #end
    #def test_equality
    #    assert(Dollar.new(5).equals(Dollar.new(5)))
    #    assert(!Dollar.new(5).equals(Dollar.new(6)))
    #end
end