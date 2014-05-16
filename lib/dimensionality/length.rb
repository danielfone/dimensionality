require 'bigdecimal'
require 'dimensionality/scale_prefixes'

module Dimensionality
  class Length
    attr_reader :units, :magnitude, :si_value, :unit_conversion

    CONVERSIONS = Dimensionality.prefix_units(:meters, 1).merge(
      feet:   3.28084,
      yards:  1.09361,
    ).freeze

    def initialize(magnitude, units=:meters)
      self.units = units
      @si_value     = BigDecimal.new(magnitude, 0) / unit_conversion
    end

    def units=(units)
      @unit_conversion = CONVERSIONS.fetch units
      @units = units
    rescue KeyError
      raise ArgumentError, "Unknown unit #{units.inspect}"
    end

    def ==(other)
      si_value == other.si_value
    end

    def eql?(other)
      self == other && units == other.units
    end

    def +(other)
      #raise TypeError, "can't add #{value.class} to Length" unless Length === value
      self.class.new(si_value + other.si_value).to(units)
    end

    def magnitude
      @si_value * unit_conversion
    end

    def to_f
      magnitude.to_f
    end

    def to(units)
      self.units = units
      self
    end

    def inspect
      "#<#{self.class} #{to_s}>"
    end

    def to_s
      "#{to_f} #{@units}"
    end

  end
end