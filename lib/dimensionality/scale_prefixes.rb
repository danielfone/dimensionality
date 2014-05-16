module Dimensionality

  SCALE_PREFIXES = {
    nil   => 1,
    :centi => 100,
    :milli => 1000,
    :kilo  => 0.001,
  }

  module_function

  def prefix_units(units, unit_conversion)
    Hash[*SCALE_PREFIXES.map { |k,v| ["#{k}#{units}".to_sym, v * unit_conversion] }.flatten]
  end
end
