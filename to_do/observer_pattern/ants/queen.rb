module Observable
  attr_accessor :state

  def attachObserver(o)
    @observers ||= []
    @observers << o if !@observers.include?(o)
  end

  def removeObserver(o)
    @observers.delete(o)
  end

  def state=(s)
    @state = s
    @observers.each do |o|
      o.update(self) # more on update() later!
    end
  end
end

class QueenAnt
  include Observable
end