require 'dimensionality/length'

module Dimensionality
  module Units
    module_function

    def Length(value, units)
      case value
      when Length then value.to(units)
      else
        Length.new value, units
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
