module MeasurementHelper
  def measure(quantity, unit_of_measure)
    amount = Unit(quantity.to_s + Jigger::BASE_UNIT_OF_MEASURE)
    converted_amount = amount.convert_to(unit_of_measure)
    prettify(converted_amount, unit_of_measure)
  end

  def measure_for_field(quantity, unit_of_measure)
    amount = measure(quantity, unit_of_measure)
    amount.scalar
  end

  def only_unit_of_measure(amount)
    unit_pattern = /[\d\/\. ]/
    unit_of_measure = amount.to_s.gsub(unit_pattern, "")
    unit_of_measure
  end

  private

  def prettify(amount, unit_of_measure)
    quantity = amount.scalar.to_f
    Unit(quantity.to_s + unit_of_measure)
  end
end
