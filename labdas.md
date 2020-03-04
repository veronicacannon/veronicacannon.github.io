# lambdas

lambdas allow you to *define* a block

```ruby
greeting = -> { "Hello, world!" }
```

lambdas are anonymous when they are not assigned to a variable

```ruby
-> (x) { x + 1 }
```

lambdas aren't executed when they are defined, they are executed then they are called

```ruby
add_one = -> (x) { x + 1 }
add_one.call(9) # 10
```

lambdas can be called a couple different ways

```ruby
add_one.(9) # 10
add_one[9] # 10
```

## example use

Define a lambda to use a custom method with map

  ```ruby
  add_one = -> (x) { x + 1 }
  [10, 20, 30].map(&add_one) # [11, 21 31]
  ```

Chain lambdas together (currying) for a functional style

```ruby
add_one = -> (x) { x + 1 }
double_up = -> (x) { x * 2}
decorate = -> (x) { " -#{x}- " }
all = add_one >> double_up >> decorate
[10, 20, 30].map(&all) # [" -22- ", " -42- ", " -62- "]
```

## references

[https://www.honeybadger.io/blog/using-lambdas-in-ruby/]

[https://www.rubyguides.com/2016/02/ruby-procs-and-lambdas/]

##### Stabby lambda syntax was introduced in Ruby 1.9