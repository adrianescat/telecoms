require 'require_all'
require_all '../lib'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
end
