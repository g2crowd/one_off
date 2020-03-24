# frozen_string_literal: true

module OneOff
  class Engine < ::Rails::Engine
    isolate_namespace OneOff
    config.generators.api_only = true
  end
end
