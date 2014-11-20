module QuantityHelper
  def pretty_number(qty)
    number_with_precision(qty,
                          precision: 3,
                          strip_insignificant_zeros: true,
                         )
  end

  def pretty_amount(qty, uom)
    pluralize(pretty_number(qty), uom)
  end
end
