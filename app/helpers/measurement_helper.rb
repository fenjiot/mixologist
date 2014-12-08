module MeasurementHelper
  def measure(quantity, unit_of_measure)
    amount = Unit(quantity.to_s + Jigger::BASE_UNIT_OF_MEASURE)
    amount = amount.convert_to(unit_of_measure)
  end

  def measure_for_field(quantity, unit_of_measure)
    amount = measure(quantity, unit_of_measure)
    amount.scalar
  end
end
