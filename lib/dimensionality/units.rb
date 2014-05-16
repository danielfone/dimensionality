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

    Dimensionality::Length::CONVERSIONS.keys.each do |units|
      method_name = units.to_s
      method_name = method_name[0].upcase + method_name[1..-1]
      define_method method_name do |value|
        Length.new(value, units)
      end
    end

  end
end
