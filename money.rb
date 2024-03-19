class Money 
    def initialize(amount,currency)
        @amount = amount
        @currency = currency
    end
    def times(multiplier)    
        Money.new(@amount * multiplier,@currency)
    end
    def reduce(bank,to)
        rate = bank.rate(@currency, to)
        Money.new(amount/rate,to)
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
    def initialize
        @rates = Hash.new(0)
    end
    def reduce(source,to)
        source.reduce(self,to)
    end
    def addRate(from,to,rate)
        @rates[Pair.new(from,to)] = rate
    end
    def rate(from, to)
        if from == to
            1
        else
            @rates[Pair.new(from,to)]
        end
    end
end

class Sum
    attr_reader :augend, :addend
    def initialize(augend, addend)
        @augend = augend
        @addend = addend
    end
    def reduce(bank,to)
        amount = @augend.reduce(bank,to).instance_variable_get(:@amount) + @addend.reduce(bank,to).instance_variable_get(:@amount)
        Money.new(amount, to)
    end
    def plus(addend)
        Sum.new(self, addend)
    end
    def times(multiplier)
        Sum.new(@augend.times(multiplier),@addend.times(multiplier))
    end
end

class Pair
    attr_reader :from, :to
    def initialize(from,abc)
        @from = from
        @to =  abc
    end
    def ==(object)
        pair = object
        @from == pair.from && @to == pair.to
    end
    def eql?(object)
        pair = object
        @from.eql?(pair.from) && @to.eql?(pair.to)
    end
    def hash()
        0
    end
end