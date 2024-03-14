class Franc 
    #attr_reader :amount
    def initialize(amount)
        @amount = amount
    end
    def times(multiplier)    
        Franc.new(@amount * multiplier)
    end
    def ==(dollar)
        @amount == dollar.instance_variable_get(:@amount)
    end
    private 
    def amount
        @amount
    end
end