require 'dimensionality/length'

module Dimensionality
  module Units
    module_function

    def Length(value, units)
      case value
      when Length   then value.to(units)
      when Numeric  then Length.new value, units
      else
        raise TypeError, "can't convert #{value.class} into Length"
      end
    end

    def Centimeter(value)
      Length(value, :centimeters)
    end

    def Meter(value)
      Length(value, :meters)
    end
  end
end
