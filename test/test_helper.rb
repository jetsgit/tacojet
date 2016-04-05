ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)

# require "minitest-rails"
require "minitest/reporters"
require "minitest/spec"
require "rails/test_help"
require "shoulda/context"
require "shoulda/matchers"

class ActiveSupport::TestCase
  fixtures :all
  extend Minitest::Spec::DSL
end


class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  # Note: You'll currently still have to declare fixtures explicitly in integration tests

  fixtures :all
  extend MiniTest::Spec::DSL

  register_spec_type self do |desc|
    desc < ActiveRecord::Base if desc.is_a? Class
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # with.library :active_record
    # with.library :active_model
    # with.library :action_controller
    # with.test_framework :minitest_5
    with.library :rails
  end
end

module Minitest
  module Reporters
    class AwesomeReporter < DefaultReporter
      GRAY = '0;36'
      GREEN = '1;32'
      RED = '1;31'

      def initialize(options = {})
        super
        @slow_threshold = options.fetch(:slow_threshold, nil)
      end

      def record_pass(test)
        if @slow_threshold.nil? || test.time <= @slow_threshold
          super
        else
          gray('O')
        end
      end

      def color_up(string, color)
        color? ? "\e\[#{ color }m#{ string }#{ ANSI::Code::ENDCODE }" : string
      end

      def red(string)
        color_up(string, RED)
      end

      def green(string)
        color_up(string, GREEN)
      end

      def gray(string)
        color_up(string, GRAY)
      end
    end
  end
end

reporter_options = { color: true} #  , slow_count: 5 
Minitest::Reporters.use! [Minitest::Reporters::AwesomeReporter.new(reporter_options)]
