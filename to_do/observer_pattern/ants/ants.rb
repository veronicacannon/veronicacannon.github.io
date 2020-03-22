# https://docs.microsoft.com/en-us/dotnet/standard/events/observer-design-pattern
# https://era86.github.io/2012/12/22/basic-observer-design-pattern-in-ruby.html
# https://refactoring.guru/design-patterns/observer/ruby/example

queen = QueenAnt.new

worker1 = WorkerAnt.new
worker2 = WorkerAnt.new
worker3 = WorkerAnt.new

queen.attachObserver(worker1)
queen.attachObserver(worker2)

queen.state = 'sleeping'
# I am working hard. Queen has changed state to sleeping!" <-- worker1
# I am working hard. Queen has changed state to sleeping!" <-- worker2