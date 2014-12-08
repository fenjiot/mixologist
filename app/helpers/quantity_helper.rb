module QuantityHelper
  def pretty_number(quantity)
    number_with_precision(quantity,
                          precision: 3,
                          strip_insignificant_zeros: true,
                         )
  end

  def pretty_amount(quantity, unit_of_measure)
    pluralize(pretty_number(quantity), unit_of_measure)
  end
end
