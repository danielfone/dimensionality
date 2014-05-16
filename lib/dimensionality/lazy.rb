require 'dimensionality/length'

module LazyUnitDeclaration

  def self.included(base)
    Dimensionality::Length::CONVERSIONS.keys.each do |units|
      define_method units do
        Dimensionality::Length.new(self, units)
      end
    end
  end

end

Numeric.send :include, LazyUnitDeclaration
String.send :include, LazyUnitDeclaration
