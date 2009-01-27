# ---- requirements
require 'rubygems'
require 'spec'
require 'mocha'

$LOAD_PATH << File.expand_path("../lib", File.dirname(__FILE__))
require 'gettext_test_log'

# ---- rspec
Spec::Runner.configure do |config|
  config.mock_with :mocha
end


# ---- bugfix
#`exit?': undefined method `run?' for Test::Unit:Module (NoMethodError)
#can be solved with require test/unit but this will result in extra test-output
module Test
  module Unit
    def self.run?
      true
    end
  end
end


# ---- Helpers
def pending_it(text,&block)
  it text do
    pending(&block)
  end
end