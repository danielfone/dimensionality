require 'rspec'
require 'dimensionality/units'

module Dimensionality

  describe Units do
    include Units

    describe '#Centimeter(10)' do
      subject { Centimeter(10) }
      it { should be_a Length }
      its(:units) { should eq :centimeters }
      its(:magnitude) { should eq 10 }
    end

    describe '#Meter(1)' do
      subject { Meter(1) }
      it { should be_a Length }
      its(:units) { should eq :meters }
      its(:magnitude) { should eq 1 }
    end
  end
end
