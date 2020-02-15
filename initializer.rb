Dir['classes/*.rb'].each { |file| require_relative file }
Dir['modules/*.rb'].each { |file| require_relative file }
Dir['lib/*.rb'].each     { |file| require_relative file }

require 'csv'
