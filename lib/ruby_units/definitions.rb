Unit.define("dash") do |unit|
  unit.aliases = %w{dash dashes}
  unit.definition = Unit(".03125 fluid-ounces")
  unit.display_name = "dash"
end

Unit.define("pony") do |unit|
  unit.aliases = %w{pony ponies}
  unit.definition = Unit("1.0 fluid-ounces")
  unit.display_name = "pony"
end

Unit.define("shot") do |unit|
  unit.aliases = %w{shot shots}
  unit.definition = Unit("1.0 fluid-ounces")
  unit.display_name = "shot"
end

Unit.define("splash") do |unit|
  unit.aliases = %w{splash splashs}
  unit.definition = Unit(".125 fluid-ounces")
  unit.display_name = "splash"
end

Unit.define("measure") do |unit|
  unit.aliases = %w{measure msr measures}
  unit.definition = Unit("0.9 fluid-ounces")
  unit.display_name = "measure"
end

Unit.define("mickey") do |unit|
  unit.aliases = %w{mickey mickeys}
  unit.definition = Unit("13.0 fluid-ounces")
  unit.display_name = "mickey"
end

Unit.define("jigger") do |unit|
  unit.aliases = %w{jigger jiggers}
  unit.definition = Unit("0.9 fluid-ounces")
  unit.display_name = "jigger"
end

Unit.define("split") do |unit|
  unit.aliases = %w{split splits}
  unit.definition = Unit("6.0 fluid-ounces")
  unit.display_name = "split"
end

Unit.define("nip") do |unit|
  unit.aliases = %w{nip nips miniature miniatures}
  unit.definition = Unit("2.0 fluid-ounces")
  unit.display_name = "nip"
end

Unit.define("tenth") do |unit|
  unit.aliases = %w{tenth tenths}
  unit.definition = Unit("12.8 fluid-ounces")
  unit.display_name = "tenth"
end

Unit.define("fifth") do |unit|
  unit.aliases = %w{fifth fifths}
  unit.definition = Unit("25.6 fluid-ounces")
  unit.display_name = "fifth"
end

Unit.define("half-gallon") do |unit|
  unit.aliases = %w{half-gallon half-gallons}
  unit.definition = Unit("0.5 gallons")
  unit.display_name = "half-gallon"
end
