class Money 
    def ==(money)
        @amount == money.instance_variable_get(:@amount) && self.class == money.class
    end
    private 
    def amount
        @amount
    end
end

class Dollar < Money
    #attr_reader :amount
    def initialize(amount)
        @amount = amount
    end
    def times(multiplier)    
        Dollar.new(@amount * multiplier)
    end
end

class Franc < Money
    #attr_reader :amount
    def initialize(amount)
        @amount = amount
    end
    def times(multiplier)    
        Franc.new(@amount * multiplier)
    end
end