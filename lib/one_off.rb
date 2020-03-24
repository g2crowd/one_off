# frozen_string_literal: true

require 'one_off/engine'
require 'one_off/configuration'
require 'one_off/file'

module OneOff
  class << self
    def configuration
      @configuration ||= OneOff::Configuration.new
    end

    alias config configuration

    def configure
      yield configuration
    end
  end
end
