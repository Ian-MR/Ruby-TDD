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
