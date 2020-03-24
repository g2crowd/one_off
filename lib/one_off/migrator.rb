# frozen_string_literal: true

module OneOff
  class Migrator
    class << self
      def run(files: pending_files)
        files.sort_by(&:version).each do |file|
          OneOff::ExecutorJob.perform_later(file)
          Rails.logger.info "=== Queued one_off task #{file.task_name}"
          OneOff::Task.create_or_find_by!(version: file.version)
        end
      end

      def db_versions
        @db_versions ||= OneOff::Task.pluck(:version).map(&:to_i)
      end

      def pending_files
        OneOff::File.all.index_by(&:version).except(*db_versions).values
      end

      def matching(pattern)
        OneOff::File.all.select { |f| f.filename.match? pattern }
      end
    end
  end
end
