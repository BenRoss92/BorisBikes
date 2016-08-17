require 'boris_bikes.rb'

describe DockingStation do
  before(:each) do
    @bike = Bike.new
  end

  it 'should release the working bike' do
    expect(@bike).to be_an_instance_of(Bike)
    expect(@bike.working?).to eq(true)
  end

  it 'should raise error if no bikes available' do
    expect{subject.release_bike}.to raise_error(RuntimeError)
  end

  it 'should dock a bike to an empty station' do
    expect(subject.dock(@bike)).to eq([@bike])
  end

  it 'should raise error if station is full' do
      subject.capacity.times { subject.dock(Bike.new)}
      expect{subject.dock(Bike.new)}.to raise_error 'Docking Station is Full'
  end

  it 'should be able to set capacity to a given number' do
    i = 10
    station = DockingStation.new(i)
    expect(station.capacity).to eq(i)
  end

  it 'should set the default capacity to DEFAULT_CAPACITY' do
    expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  it 'should not release a bike that is a non-working bike and instead release the working bike' do
    working_bike = Bike.new
    non_working_bike = Bike.new(false)
    non_working_bike2 = Bike.new(false)
    station = DockingStation.new

    station.dock(non_working_bike2)
    station.dock(working_bike)
    station.dock(non_working_bike)

    expect(station.release_bike).to eq(working_bike)
  end

  it 'should return an error if you try to get a bike from a station with only non-working bikes' do
    non_working_bike = Bike.new(false)
    non_working_bike2 = Bike.new(false)
    station = DockingStation.new

    station.dock(non_working_bike2)
    station.dock(non_working_bike)

    expect{station.release_bike}.to raise_error 'No bikes are working'
  end

end
