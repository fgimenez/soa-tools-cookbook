require 'chefspec'

RSpec.configure do |config|
  config.platform = 'ubuntu'

  config.version = '12.04'
end

#at_exit { ChefSpec::Coverage.report! }

#ChefSpec::Coverage.filters << File.expand_path('../../', __FILE__)
