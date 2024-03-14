# Cápitulo 3 - Money Example

## Criando o teste

Código:

```ruby
require 'minitest/autorun'
class Test < Minitest::Test
    def test_multiplication
        five = Dollar.new(5)
        five.times(2)
        assert_equal(10, five.amount)
    end
end
```

Erro:

```
Run options: --seed 36124

# Running:

E

Error:
Test#test_multiplication:
NameError: uninitialized constant Test::Dollar
    money.rb:7:in `test_multiplication'


bin/rails test money.rb:6



Finished in 0.020465s, 48.8646 runs/s, 0.0000 assertions/s.
1 runs, 0 assertions, 0 failures, 1 errors, 0 skips
```

## Corrigindo primeiro erro

Código:

```ruby
class Dollar 
end
```

Erro:

```
Run options: --seed 15880

# Running:

E

Error:
Test#test_multiplication:
ArgumentError: wrong number of arguments (given 1, expected 0)
    money.rb:8:in `initialize'
    money.rb:8:in `new'
    money.rb:8:in `test_multiplication'


bin/rails test money.rb:7



Finished in 0.008401s, 119.0320 runs/s, 0.0000 assertions/s.
1 runs, 0 assertions, 0 failures, 1 errors, 0 skips
```

## Corrigindo segundo erro

Código:

```ruby
class Dollar 
    def initialize(amount)
    end
end
```

Erro:

```
Run options: --seed 30555

# Running:

E

Error:
Test#test_multiplication:
NoMethodError: undefined method `times' for #<Dollar:0x00000198d4078a28>
    money.rb:11:in `test_multiplication'


bin/rails test money.rb:9



Finished in 0.007178s, 139.3243 runs/s, 0.0000 assertions/s.
1 runs, 0 assertions, 0 failures, 1 errors, 0 skips
```

## Corrigindo terceiro erro

Código:

```ruby
class Dollar 
    def initialize(amount)
    end

    def times(multiplier)
    end
end
```

Erro:

```
Run options: --seed 12960

# Running:

E

Error:
Test#test_multiplication:
NoMethodError: undefined method `amount' for #<Dollar:0x00000226eedf8150>
    money.rb:15:in `test_multiplication'


bin/rails test money.rb:12



Finished in 0.006998s, 142.9082 runs/s, 0.0000 assertions/s.
1 runs, 0 assertions, 0 failures, 1 errors, 0 skips
```

## Corrigindo quarto erro

Código:

```ruby
class Dollar 
    attr_reader :amount
    def initialize(amount)
    end

    def times(multiplier)
    end
end
```

Erro:

```
Run options: --seed 15843

# Running:

F

Failure:
Test#test_multiplication [money.rb:16]:
Expected: 10
  Actual: nil


bin/rails test money.rb:13



Finished in 0.006802s, 147.0069 runs/s, 147.0069 assertions/s.
1 runs, 1 assertions, 1 failures, 0 errors, 0 skips
```

## Resolvendo a falha no teste de uma forma simples

Código:

```ruby
class Dollar 
    attr_reader :amount
    def initialize(amount)
        @amount = 10
    end

    def times(multiplier)
    end
end
```

Erro:

```
Run options: --seed 58065

# Running:

.

Finished in 0.005535s, 180.6554 runs/s, 180.6554 assertions/s.
1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

## Visualizando a duplicação

Código:

```ruby
class Dollar 
    attr_reader :amount
    def initialize(amount)
    end

    def times(multiplier)
        @amount = 5 * 2
    end
end
```

Erro:

```
Run options: --seed 38672

# Running:

.

Finished in 0.006042s, 165.5108 runs/s, 165.5108 assertions/s.
1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

## Removendo duplicação

Código:

```ruby
class Dollar 
    attr_reader :amount
    def initialize(amount)
        @amount = amount
    end
    def times(multiplier)
        @amount = @amount * 2
    end
end
```

Erro:

```
Run options: --seed 43501

# Running:

.

Finished in 0.006473s, 154.4831 runs/s, 154.4831 assertions/s.
1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

## Removendo duplicação

Código:

```ruby
class Dollar 
    attr_reader :amount
    def initialize(amount)
        @amount = amount
    end
    def times(multiplier)
        @amount = @amount * multiplier
    end
end
```

Erro:

```
Run options: --seed 58197

# Running:

.

Finished in 0.006026s, 165.9448 runs/s, 165.9448 assertions/s.
1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

## Simplificando código

Código:

```ruby
class Dollar 
    attr_reader :amount
    def initialize(amount)
        @amount = amount
    end
    def times(multiplier)
        @amount *= multiplier
    end
end
```

Erro:

```
Run options: --seed 51509

# Running:

.

Finished in 0.005493s, 182.0499 runs/s, 182.0499 assertions/s.
1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

# Cápitulo 4 - Degenerate objects

Código:

```ruby
require 'minitest/autorun'

class Test < Minitest::Test
    def test_multiplication
        five = Dollar.new(5)
        five.times(2)
        assert_equal(10, five.amount)
        five.times(3)
        assert_equal(15, five.amount)
    end
end
```

Erro:

```
Run options: --seed 57116

# Running:

F

Failure:
Test#test_multiplication [money.rb:19]:
Expected: 15
  Actual: 30


bin/rails test money.rb:14



Finished in 0.007153s, 139.7937 runs/s, 279.5873 assertions/s.
1 runs, 2 assertions, 1 failures, 0 errors, 0 skips
```

Código:

```ruby
class Dollar 
    attr_reader :amount
    def initialize(amount)
        @amount = amount
    end
    def times(multiplier)
        @amount *= multiplier
        nil
    end
end

require 'minitest/autorun'

class Test < Minitest::Test
    def test_multiplication
        five = Dollar.new(5)
        product = five.times(2)
        assert_equal(10, product.amount)
        product =  five.times(3)
        assert_equal(15, product.amount)
    end
end
```

Erro:

```
Run options: --seed 47573

# Running:

E

Error:
Test#test_multiplication:
NoMethodError: undefined method `amount' for nil:NilClass
    money.rb:18:in `test_multiplication'


bin/rails test money.rb:15



Finished in 0.007368s, 135.7165 runs/s, 0.0000 assertions/s.
1 runs, 0 assertions, 0 failures, 1 errors, 0 skips
```

Código:

```ruby
class Dollar 
    attr_reader :amount
    def initialize(amount)
        @amount = amount
    end
    def times(multiplier)    
        Dollar.new(@amount * multiplier)
    end
end
```

Erro:

```
Run options: --seed 52236

# Running:

.

Finished in 0.005760s, 173.6202 runs/s, 347.2403 assertions/s.
1 runs, 2 assertions, 0 failures, 0 errors, 0 skips
```

# Cápitulo 5 - Equality for All

Código:

```ruby
class Test < Minitest::Test
    def test_equality
        assert(Dollar.new(5).equals(Dollar.new(5)))
    end
end
```

Erro:

```
Run options: --seed 63695

# Running:

E

Error:
Test#test_equality:
NoMethodError: undefined method `equals' for #<Dollar:0x0000016e06687778 @amount=5>
    money.rb:22:in `test_equality'


bin/rails test money.rb:21



Finished in 0.007271s, 137.5346 runs/s, 0.0000 assertions/s.
1 runs, 0 assertions, 0 failures, 1 errors, 0 skips
```

Código:

```ruby
class Dollar 
    attr_reader :amount
    def initialize(amount)
        @amount = amount
    end
    def times(multiplier)    
        Dollar.new(@amount * multiplier)
    end
    def ==(dollar)
        @amount == dollar.amount
    end
end

require 'minitest/autorun'

class Test < Minitest::Test
    def test_equality
        assert(Dollar.new(5) == Dollar.new(5))
        assert(!(Dollar.new(5) == Dollar.new(6)))
    end
end
```

Erro:

```
Run options: --seed 24907

# Running:

.

Finished in 0.005737s, 174.3193 runs/s, 348.6386 assertions/s.
1 runs, 2 assertions, 0 failures, 0 errors, 0 skips
```
# Cápitulo 6- Privacy

Código:

```ruby
class Dollar 
    attr_reader :amount
    def initialize(amount)
        @amount = amount
    end
    def times(multiplier)    
        Dollar.new(@amount * multiplier)
    end
    def ==(dollar)
        @amount == dollar.amount
    end
end

require 'minitest/autorun'

class Test < Minitest::Test
    def test_multiplication
        five = Dollar.new(5)
        assert_equal(Dollar.new(10), five.times(2)) 
        assert_equal(Dollar.new(15), five.times(3))
    end
end
```

Erro:

```
Run options: --seed 8535

# Running:

.

Finished in 0.005962s, 167.7261 runs/s, 335.4523 assertions/s.
1 runs, 2 assertions, 0 failures, 0 errors, 0 skips
```

Código:

```ruby
class Dollar 
    #attr_reader :amount
    def initialize(amount)
        @amount = amount
    end
    def times(multiplier)    
        Dollar.new(@amount * multiplier)
    end
    def ==(dollar)
        @amount == dollar.instance_variable_get(:@amount)
    end
    private 
    def amount
        @amount
    end
end

require 'minitest/autorun'

class Test < Minitest::Test
    def test_multiplication
        five = Dollar.new(5)
        assert_equal(Dollar.new(10), five.times(2)) 
        assert_equal(Dollar.new(15), five.times(3))
    end
end
```

Erro:

```
Run options: --seed 39306

# Running:

.

Finished in 0.004936s, 202.5768 runs/s, 405.1536 assertions/s.
1 runs, 2 assertions, 0 failures, 0 errors, 0 skips
```

# Cápitulo 7 - Franc-ly Speaking

```ruby
require 'minitest/autorun'

class Test < Minitest::Test
    def test_franc_multiplication
        five = Franc.new(5)
        assert_equal(Franc.new(10), five.times(2)) 
        assert_equal(Franc.new(15), five.times(3))
    end
end
```

Erro:

```
Run options: --seed 19952

# Running:

E

Error:
Test#test_franc_multiplication:
NameError: uninitialized constant Test::Franc
    money.rb:6:in `test_franc_multiplication'


bin/rails test money.rb:5



Finished in 0.006962s, 143.6451 runs/s, 0.0000 assertions/s.
1 runs, 0 assertions, 0 failures, 1 errors, 0 skips

