### ARRAYS =====================================================================
days = %w{Monday Tuesday Wednesday Thursday Friday Saturday Sunday}

days[-1]
days.last
days.first

letters = [*('a'..'z')]

sharks = ["Hammerhead", "Great White", "Tiger"]
sharks.push("Bullhead")
sharks.unshift("Angel") # add to front of array
sharks.delete("Great White")
sharks.pop # remove last
sharks.shift # remove first

sharks.each_with_index do |shark, index| 
  puts "The index is #{index}"
  puts "The value is #{shark}"
end

sharks[42]
sharks.fetch(42)

sharks[1,2] # grab two elements
sharks.take(2) # take two elements
sharks.slice!(1,2) # remove two elements

sample = sharks.sample(2) # return two random

sharks.include? "Tiger"

sharks.find {|item| item.include?("a")}  # finds first
sharks.select {|item| item.include?("a")} # returns all

# select and reject both return a new array, leaving the original array unchanged. 
# However, if you use the select! and reject! methods, the original array will be modified.

# The find_all method is an alias for select, but there is no find_all! method.

sharks.reverse
sharks.sort # for simple arrays

sharks = ["Tiger", "Great White"]
new_sharks = ["Tiger", "Hammerhead"]
sharks + new_sharks # will create duplicates
sharks | new_sharks # merge, no duplicates
sharks - new_sharks

sharks = ["Hammerhead", "Great White", "Tiger", "Whale"]
options = sharks.map {|shark| "<option>#{shark}</option>"}
output = options.join("\n")

[1,2,3].reduce(&:+)
[1, 2, 3].sum

[ "a", nil, "b", nil, "c", nil ].compact # compact removes nils

a.shuffle!(random: Random.new(1))  #=> [1, 3, 2]

a = %w{ a b c d e f }
a.values_at(1, 3, 5)

days = ['mon', 'tues', 'wed', 'thur', 'fri']
# Create an array of the elements with indexes 0 and 2. 
# The return value should be ['mon', 'wed']
days.values_at(0, 2)

['a', 'b'] == ['b', 'a'] # returns false, arrays are always ordered 

manly = ['batman', 'manbot', 'mace', 'tulip', 'nah man, nah']
# Create an array of all elements in the manly array that contain the word "man". 
# The return value should be: ["batman", "manbot", "nah man, nah"]
manly.grep(/man/)
manly.select { |who| who.include?("man") }

players = [['r', 'kelly'], ['50', 'cent'], ['miley', 'cyrus']]
# Use the players array to construct the following array: ["kelly", "cent", "cyrus"]
players.map do |_, last_name| # _	indicates extraneous element
  last_name
end

numbers = [1, 2, 3, 4]
# Sum all the elements in the numbers array.
numbers.inject(&:+)

arr = ['onyx', 'wu tang', 'biggie']
# Get the 'biggie' string from arr.
arr[arr.find_index('biggie')]
# .find_index	returns index of first element in array; returns nil if not found
# !!! if not found, becomes nil and will error as arr[nil]

t = [1,2,3].tap(&:pop)
# .tap	returns the object (instead of the result of the method)
# (&:pop)	proc of pop on array, returns 3
# https://www.engineyard.com/blog/five-ruby-methods-you-should-be-using



### HASH =======================================================================
# A hash is an ordered collection of key / value pairs. The keys in a hash cannot be duplicates and any Ruby object can be a key or a value.

# hash is not simple sort
sharks_hash = [
  {name: "Hammerhead"},
  {name: "Great white"},
  {name: "Angel"}
]

sharks_hash.sort{|a, b| a[:name] <=> b[:name]}
sharks_hash.sort_by{|shark| shark[:name] }
[1,2,3,4,1,5,3].uniq

# Create the following array:
# [1, 10, 100, 1_000, 10_000, 100_000, 1_000_000]
7.times.map { |i| 10 ** i }



### RECURSION ==================================================================
# https://www.khanacademy.org/computing/computer-science/algorithms#recursive-algorithms
# simple recursion example
# https://vimeo.com/24716767
# ( ( ( (1) + 2) + 3) + 4)

def sum_upto(4)
  return 1 if n == 1
  sum_upto(n - 1) + n
end

sum_upto 1 # => 1
sum_upto 2 # => 3
sum_upto 3 # => 6
sum_upto 4 # => 10
sum_upto 5 # => 15
sum_upto 100 # => 5050

def fibonacci(n)
  if n < 2
    n
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end

# alternative fibonocci
fib = [0, 1]
# Use fib to create the following array: [0, 1, 1, 2, 3, 5, 8, 13, 21, 34] 
# Notice that these are the first ten numbers in the Fibonocci sequence and 
# each number equal the sum of the prior two numbers.

while fib.length < 10
  fib << fib[-2] + fib[-1]
end

in one line
8.times.inject( [0, 1] ) { | fib | fib << fib.last(2).inject(:+) }


def factorial(n)
  n == 0 ? 1 : n * factorial(n-1)
end

people = [["bob", 320], ["edgar", 152], ["maria", 125]]
#Convert the people array to the following hash: 
# {"bob" => 320, "edgar" => 152, "maria" => 125}
Hash[people]



### MATCH =======================================================================
# Use match to grab extensions from file names

class FileMaster
  attr_reader :dirpath, :filename, :extension

  def initialize(filepath)
    @dirpath, @filename, @extension = filepath.match(%r{\A(.*/)(\w+)\.(\w+)\z}).captures
  end
end



### ATTR ===================================================================================
# attr_accessor provides the getter and setter methods for an instance variable. 
# In other words, attr_accessor provides methods to return the value of the instance 
# variable and update the value of the instance variable.

attr_reader 
attr_writer
attr_accessor



### regex ===================================================================================
%r{} is equivalent to the /.../ notation, but allows you to have '/' in your regexp 
without having to escape them:

%r{/home/user}

is equivalent to:

/\/home\/user/


===================================================================================
\A	start of string
(.*/)	single character (.) zero or more (*) up to slash (/)
(\w+)	any word character (letter, number, underscore)
\.	escaped period (to find just period)
(\w+)	any word character (letter, number, underscore)
\z	end of string

===================================================================================
captures returns an array from the match
equivalent to mtch.to_a[1..-1]

===================================================================================
Write a function that sorts the keys in a hash by the length of the key as a string.
h = {abc: "hello", 'another_key' => 123, 4567 => 'third'}

h.keys.map(&:to_s).sort_by(&:length)

h.keys		just the keys of the hash, returns an array
.map		returns an array
(&:to_s)	map block to string
.sort_by
(&:length)	map block length


===================================================================================
What is the value of the variable uncased in the code?
uncased = [“one”, “two”, “three”].map {|n| puts n.upcase }

upcased = [nil, nil, nil]
puts always returns nil


===================================================================================
Object#dup creates a shallow copy of an object. For example, it will not copy any mixed-in module methods, whereas Object#clone will. 


==================================================================================
Modules are Ruby’s way of grouping methods, classes, and constants together to provide a namespace for preventing name clashes. The second purpose of modules is to use them as mixins. Technically, Ruby only supports single inheritance, but by using modules as mixins, it is possible to share code among different classes—a key advantage of multiple inheritance—without having to give up the simplicity of the single inheritance paradigm.

===================================================================================
manly = ['batman', 'manbot', 'mace', 'tulip', 'nah man, nah']
manly.select { |word| word.include?('man') }
manly.grep /man/
manly.select {|word| word.match /man/ }


===================================================================================
Instance variables can be accessed by any instance methods in a class and are used to maintain "state" (state is the data that objects "know").  Instance variables are only available to the instance methods, not the class methods. Undefined instance variables have a default value of nil.


===================================================================================
Singleton methods are methods that are defined for a particular object (as opposed to instance methods that are defined for all objects made by the class). Class methods in Ruby are really just singleton methods defined for the class object.



===================================================================================
# singleton method old school
module Geometry
  class << self
    def rect_area(length, width)
      length * width
    end
  end
end

Geometry.rect_area(4, 5)
# => 20


### OUTPUT ===================================================================================
# The print and puts methods produce textual output on the console. The difference between the two is that the latter adds a new line character.

print "Apple "
print "Apple\n"

# The print method prints two consecutive "Apple" strings to the terminal. If we want to create a new line, 
# we must explicitly include a newline character. The newline character is \n. Behind the scenes, 
# the print method actually calls the to_s method of the object being printed.

puts "Orange"
puts "Orange"

# The puts method prints two strings to the console. Each is on its own line. The method includes automatically the newline character.

$ ./printing.rb
Apple Apple
Orange
Orange


===================================================================================
with blocks, note that precedence matters with formatting

def cool
  yield
end

p cool { “beans” }
p (cool do "beans" end ) # requires parenthesis so block attaches to cool method


===================================================================================
# way to check if file is library or can be executed
if __FILE__ == $0
  mg = MegaGreeter.new
  mg.say_hi
  mg.say_bye
end


===================================================================================
# check if number is prime
require ‘prime’
n.prime? => returns true or false

===========================================================================

x = Array.new()
y = []
x.eql?(y) 	returns true
x.equal?(y)	returns false
x.object_id	2042
y.object_id	2044
== – Checks if the value of two operands are equal (often overridden to provide a class-specific definition of equality).

=== – Specifically used to test equality within the when clause of a case statement (also often overridden to provide meaningful class-specific semantics in case statements).

eql? – Checks if the value and type of two operands are the same (as opposed to the == operator which compares values but ignores types). For example, 1 == 1.0 evaluates to true, whereas 1.eql?(1.0) evaluates to false.

equal? – Compares the identity of two objects; i.e., returns true iff both operands have the same object id (i.e., if they both refer to the same object). Note that this will return false when comparing two identical copies of the same object.



===========================================================================

What is the sum of all the numbers between 0 and 100 that are divisible by both 3 and 5?

(0..100).select { |number| number % 3 == 0 && number % 5 == 0 }.inject(&:+)


=========================================================================== ===========================================================================
What does the following code return? Explain.

haha = {a: 1, b: 2}
bozo = haha.merge!({lala: "word up"})
haha.object_id == bozo.object_id
 
The Hash#merge! method combines two hashes and mutates the original hash. Since the haha and bozo variables are assigned to the same object, they have the same object id. If the Hash#merge method was used (notice no !), then the original object would not have been mutated and the object ids would be different.



===========================================================================
videos = {yoga: "stretch it out"}
Retrieve the value associated with the :dumb_and_dumber key in the videos hash. If the :dumb_and_dumber key is not available in the hash, return the string "no one's home".

videos.fetch(:dumb_and_dumber, "no one's home")

.fetch 	throws an error if key is not found, unless default is present
videos[:dumb_and_dumber]	will return nil
my_hash = Hash.new("cheese")	set default on hash, instead of fetch



===========================================================================
splat operator

The list of parameters passed to an object is, in fact, available as a list. 
To do this, we use what is called the splat operator - which is just an asterisk (*).

*	go("a","b","c")
**	go(x: 100, y: 200)

class Person
  def initialize(args)
    @first_name = args.fetch(:first_name)
    @age = args.fetch(:age)
  end
end

mohammed = Person.new({age: 12, first_name: "Mohammed"})



===========================================================================

Monkey patch the Hash class and define a method called all_values_even? that returns true if all the values in a Hash are even.

class Hash
  def all_values_even?
    self.values.all?(&:even?)
  end
end

{a: 2, b: 4, c: 6}.all_values_even? # returns true



# ===========================================================================
# nil&.some_method	returns nil

# Ruby safe operator (doesn't throw an error)
# try requires active support

# instance variables that default to a value of nil

===========================================================================

# The ||= operator (pronounced "or-equal operator")

===========================================================================
create_person("David", "Black", "New Jersey")
Three strings are serving as method arguments, and those strings are objects. But the argument list itself is not an object. 

In addition to syntactic constructs like argument lists, Ruby also includes non-objects in the form of keywords like if, class, alias, and begin, end, rescue. 

So not everything is Ruby is an object, and for good reason. But there’s a corollary to this point, and an important one: even though not everything is an object, everything does evaluate to an object.


===========================================================================
Identify the object, message, method, and receiver in the following example.

x = 5.to_f

5	object
to_f	message
to_f	method
5	receiver

"table".upcase()
This example uses "dot notation" to send the upcase message to the "table" object. The "table" object is the receiver of the "upcase" message and invokes the upcase() method when it receives the "upcase" message.

my_calculator.send(:add, 3, 4)
Dot notation is a more common way to send messages (i..e my_calculator.add(3, 4)), but the send() method can also be used to send messages.


===========================================================================
methods
The return keyword specifies the object to be returned to the caller when the method has done its work. 
If no return keyword is specified, the object created by the last line in the method is automatically 
treated as the return value. A method must always return exactly one object.

Calling return without specifying an object to return results in a nil, which is returned by default. 
