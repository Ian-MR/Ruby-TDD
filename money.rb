class Money 
    def initialize(amount,currency)
        @amount = amount
        @currency = currency
    end
    def times(multiplier)    
        Money.new(@amount * multiplier,@currency)
    end
    def reduce(to)
        self
    end
    def plus(addend)
        Sum.new(self, addend)
    end
    def self.dollar(amount)
        Money.new(amount,"USD")
    end
    def self.franc(amount)
        Money.new(amount,"CHF")
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

class Bank
    def reduce(source,to)
        source.reduce(to)
    end
end

class Sum
    attr_reader :augend, :addend
    def initialize(augend, addend)
        @augend = augend
        @addend = addend
    end
    def reduce(to)
        amount = @augend.instance_variable_get(:@amount) + @addend.instance_variable_get(:@amount)
        Money.new(amount, to)
    end
end