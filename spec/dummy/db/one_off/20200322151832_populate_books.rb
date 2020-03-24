# frozen_string_literal: true

require 'one_off/environments'

module OneOff
  class PopulateBooks
    include Environments

    environments :test

    def perform
      raise ArgumentError, 'Raising for specs'
    end
  end
end
