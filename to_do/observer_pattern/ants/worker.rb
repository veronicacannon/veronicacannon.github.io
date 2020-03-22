module Observer
  def update(o)
    raise 'Implement this!'
  end
end

class WorkerAnt
  include Observer

  def update(o)
    p "I am working hard. Queen has changed state to #{o.state}!"
  end
end