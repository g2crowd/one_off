# frozen_string_literal: true

module OneOff
  class ExecutorJob < ApplicationJob
    def perform(file)
      require "#{Rails.root}/db/one_off/#{file.filename}"
      Rails.logger.info "=== Starting one_off task #{file.task_name}"
      OneOff.const_get(file.task_name.camelize).new.call
      Rails.logger.info "=== Finished one_off task #{file.task_name}"
    end
  end
end
