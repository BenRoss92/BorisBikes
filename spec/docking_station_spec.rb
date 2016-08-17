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
    expect{21.times {subject.dock(Bike.new)}}.to raise_error(RuntimeError)
  end

  it 'should be able to set capacity to a given number' do
    i = 10
    station = DockingStation.new(i)
    expect(station.capacity).to eq(i)
  end

  it 'should set the default capacity to 20' do
    expect(subject.capacity).to eq(20)
  end

#
end
