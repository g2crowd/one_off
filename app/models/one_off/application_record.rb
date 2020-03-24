# frozen_string_literal: true

module OneOff
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
