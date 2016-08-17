class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20
  
  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    if @bikes.empty?
      raise "No bikes available to be released"
    else
      @bikes.pop
    end
  end

  def dock(bike_object)
    if full?
      raise "Docking Station is Full"
    else
      @bikes << bike_object
    end
  end

  private

  def full?
    if @capacity == @bikes.count
      true
    else
      false
    end
  end


end


class Bike
  def working?
    return true
  end
end
