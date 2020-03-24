# frozen_string_literal: true

require 'one_off/environments'

module OneOff
  class PopulateChapters
    include Environments

    environments :development

    def perform
      raise ArgumentError, 'Raising for specs'
    end
  end
end
