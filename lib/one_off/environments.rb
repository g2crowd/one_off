# frozen_string_literal: true

module OneOff
  module Environments
    extend ActiveSupport::Concern

    included do
      def call
        perform if Array.wrap(self.class.__environments).include?(Rails.env)
      end

      def perform
        raise NotImplementedError
      end
    end

    class_methods do
      attr_reader :__environments

      def environments(*envs)
        @__environments = envs.map(&:to_s)
      end
    end
  end
end
