require 'rspec'
require 'dimensionality/length'

module Dimensionality
  describe Length do

    describe '::CONVERSIONS' do
      it 'should contain the correct conversions' do
        expect(Length::CONVERSIONS).to eq(
          meters: 1,
          centimeters: 100.0,
          millimeters: 1000.0,
          kilometers: 0.001,
          feet:   3.28084,
          yards:  1.09361,
        )
      end
    end

    describe '#to_s' do
      it 'should include units' do
        l = described_class.new 3, :feet
        expect(l.to_s).to eq "3.0 feet"
      end
    end

    describe '#inspect' do
      it 'should include class name and string representation' do
        l = described_class.new 3.3, :centimeters
        expect(l.inspect).to eq "#<Dimensionality::Length 3.3 centimeters>"
      end
    end

    describe '#to' do
      let(:length) { described_class.new 3.3, :meters }
      it 'should convert the prefered units' do
        l = described_class.new 3.3, :meters
        expect(length.to(:centimeters).to_s).to eq '330.0 centimeters'
      end

      it 'should raise an error for invalid units' do
        expect { length.to(:foo) }.to raise_error ArgumentError
      end
    end

    describe '#to_f' do
      it 'should return the magnitude' do
        expect(Length.new(2, :meters).to_f).to eq 2.0
        expect(Length.new(2, :meters).to(:centimeters).to_f).to eq 200
      end
    end

    describe '==' do
      it 'should be compare SI values' do
        a = Length.new(2, :meters)
        b = Length.new(200, :centimeters)
        c = Length.new(5, :centimeters)
        expect(a).to eq b
        expect(b).to eq a
        expect(a).not_to eq c
        expect(c).not_to eq b
      end
    end

    describe 'eql?' do
      it 'should only be true for lengths with identical units' do
        a = Length.new(2, :meters)
        b = Length.new(2, :meters)
        c = Length.new(200, :centimeters)
        expect(a).to eql b
        expect(b).to eql a
        expect(a).not_to eql c
        expect(c).not_to eql b
      end
    end

    describe '#+' do
      require 'dimensionality/units'
      include Units

      it 'should handle differing units' do
        expect(Meter(2) + Centimeter(5)).to eql Meter('2.05')
        expect(Centimeter(5) + Meter(2)).to eql Centimeter(205)
      end

      it 'should raise error on incompatible types' do
        expect { Meter(2) + 1 }.to raise_error TypeError, "can't add Fixnum to Length"
      end
    end

  end

end

#

#cm = Centimeter(10) # => <Length 0.1>
#Meter(cm) # => <Length 0.1>

#
#Centimeter(10) + Centimeter(3)  # => <Length 13, :cm>
#Centimeter(10) + 3              # => TypeError
#Centimeter(10) + Meter(3)       # => <Length 310, :cm>
#Centimeter(10) + Kilogram(3)    # => TypeError
#v = Centimeter(10) * Meter(3)   # => <Volume 3000, :sq_cm>
#v.to_sq_meters                  # => <Volume 0.3, :sq_m>
#
#10.centimeters.to_feet

