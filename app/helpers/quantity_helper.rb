module QuantityHelper
  def pretty_number(qty)
    number_with_precision(qty,
                          precision: 3,
                          strip_insignificant_zeros: true,
                         )
  end

  def pretty_amount(qty, unit_of_measure)
    pluralize(pretty_number(qty), unit_of_measure)
  end
end
