# frozen_string_literal: true

module OneOff
  class ExecutorJob < ApplicationJob
    queue_as OneOff.config.executor_queue if OneOff.config.executor_queue
    rescue_from StandardError, with: OneOff.config.executor_rescue_handler if OneOff.config.executor_rescue_handler

    def perform(file)
      require "#{Rails.root}/db/one_off/#{file.filename}"
      Rails.logger.info "=== Starting one_off task #{file.task_name}"
      OneOff.const_get(file.task_name.camelize).new.call
      Rails.logger.info "=== Finished one_off task #{file.task_name}"
    end
  end
end
