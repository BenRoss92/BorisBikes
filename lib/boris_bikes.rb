class DockingStation
  attr_reader :bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    if @bikes.empty?
      raise "No bikes available to be released"
    else
      @bikes.each do |bike|
        if bike.working? == true
          return bike
        end
      end
      raise "No bikes are working"
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
  def initialize(working = true)
    @working = working
  end

  def working?
    @working
  end

  def change_status(status)
    @working = status
  end
end
