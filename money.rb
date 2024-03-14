class Money 
    def initialize(amount,currency)
        @amount = amount
        @currency = currency
    end
    def times(multiplier)    
        Money.new(@amount * multiplier,@currency)
    end
    def self.dollar(amount)
        Dollar.new(amount,"USD")
    end
    def self.franc(amount)
        Franc.new(amount,"CHF")
    end
    def currency
        @currency
    end
    def ==(money)
        @amount == money.instance_variable_get(:@amount) && @currency == money.currency
    end
    private 
    def amount
        @amount
    end
end

class Dollar < Money
    #attr_reader :amount
    def initialize(amount,currency)
        super(amount,currency)
    end
end

class Franc < Money
    #attr_reader :amount
    def initialize(amount,currency)
        super(amount,currency)
    end
end