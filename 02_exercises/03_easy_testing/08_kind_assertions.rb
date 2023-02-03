# https://launchschool.com/exercises/098fba0b

# Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).


assert value.kind_of? Numeric

# LS solution:

assert_kind_of Numeric, value