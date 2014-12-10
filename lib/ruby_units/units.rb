Unit.redefine!("cup") do |cup|
  cup.display_name  = "cup"
  cup.definition = Unit("8.0 fluid-ounces")
end

Unit.redefine!("fluid-ounce") do |floz|
  floz.display_name = "fluid-ounce"
end

Unit.redefine!("quart") do |quart|
  quart.display_name = "quart"
end

Unit.redefine!("pint") do |pint|
  pint.display_name = "pint"
end
