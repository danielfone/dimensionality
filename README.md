Dimensionality
==============

WIP unit conversion library.
Largely proof-of-concept. Only Length is implemented and only with addition.

e.g.

    include Dimensionality::Units
    length = Meters(2) + Feet(3) + Yards('1.234') # => #<Dimensionality::Length 4.042772973912179 meters>
    length.to :feet                               # => #<Dimensionality::Length 13.263691283730031 feet>
    length.to_f                                   # => 13.263691283730031
    puts length
    13.263691283730031 feet


    require 'dimensionality/lazy'
    length = 2.meters + '3'.feet + 1.234.centimeters  # => #<Dimensionality::Length 2.926739970739201 meters>
    length.to(:yards)                                 # => #<Dimensionality::Length 3.2007120994000977 yards>
    puts length
    3.2007120994000977 yards

    # Dimensionless arithmetic isn't allowed
    # this prevents accidental mistakes with units
    >> Meters(2) + 3
    TypeError: can't add Fixnum to Length