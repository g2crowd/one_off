# frozen_string_literal: true

require 'one_off/environments'

module OneOff
  class PopulateAuthors
    include Environments

    environments :test
  end
end
