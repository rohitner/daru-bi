Dir["#{__dir__}/clean/*.rb"].each { |file| require "daru/bi#{file.gsub(__dir__, '')}" }
