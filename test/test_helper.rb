# test_helper.rb
# This helper is working with:
# Rails v.4.2.5.2
# Ruby v.2.2.2p95
#
# Following type of tests are working:
# 'Spec-style minitest':
#   Controller
#   Model
#   Integration
#   Feature
#
# Using: Fixtures
# Using: Shoulda-Matchers

ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'shoulda/context'
require 'shoulda/matchers'
require 'minitest/reporters'
require 'minitest/spec'
require 'minitest-rails'
require 'minitest/rails/capybara'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist
module ActiveSupport
  class TestCase
    ActiveRecord::Migration.check_pending!
    fixtures :all
    extend MiniTest::Spec::DSL
    register_spec_type self do |desc|
      desc < ActiveRecord::Base if desc.is_a? Class
    end
  end
end

module ActionController
  class TestCase
    fixtures :all
    extend Minitest::Spec::DSL
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.library :rails
  end
end

module Minitest
  module Reporters
    class AwesomeReporter < DefaultReporter
      GRAY = '0;36'.freeze
      GREEN = '1;32'.freeze
      RED = '1;31'.freeze

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
        color? ? "\e\[#{color}m#{string}#{ANSI::Code::ENDCODE}" : string
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

reporter_options = { color: true } #  , slow_count: 5
Minitest::Reporters.use! \
  [Minitest::Reporters::AwesomeReporter.new(reporter_options)]
