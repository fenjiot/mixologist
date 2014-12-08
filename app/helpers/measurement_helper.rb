module MeasurementHelper
  def measure(qty, unit_of_measure)
    amount  = Unit(qty.to_s + Jigger::BASE_UNIT_OF_MEASURE)
    amount >>= unit_of_measure
  end

  def measure_for_field(qty, unit_of_measure)
    amount = measure(qty, unit_of_measure)
    amount.scalar
  end
end
