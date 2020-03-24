# frozen_string_literal: true

module OneOff
  class File
    include GlobalID::Identification

    REGEX = /\A(\d{14})_(\w+)\z/.freeze

    class << self
      def all
        Dir.glob('db/one_off/*.rb', base: Rails.root)
          .map { |f| ::File.basename(f, '.rb') }
          .select { |f| REGEX.match(f) }
          .map { |f| new(f) }
      end

      def find(id)
        all.find { |file| file.id == id.to_i }
      end
    end

    attr_reader :filename

    def initialize(filename)
      @filename = filename
    end

    def file_name_match
      @file_name_match ||= REGEX.match(filename)
    end

    def version
      file_name_match[1].to_i
    end

    alias id version

    def task_name
      file_name_match[2]
    end
  end
end
