require 'daru'
require 'daru/bi/version'
require 'daru/bi/clean'

module Daru
  class DataFrame
    include Daru::BI::Clean
  end
end
