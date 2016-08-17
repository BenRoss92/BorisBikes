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
    expect{(DockingStation::other_default + 1).times {subject.dock(Bike.new)}}.to raise_error(RuntimeError)
  end

end
