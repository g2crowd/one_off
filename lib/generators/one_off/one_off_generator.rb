# frozen_string_literal: true

require 'rails/generators'

class OneOffGenerator < Rails::Generators::NamedBase
  def create_one_off_file
    timestamp = Time.zone.now.strftime('%Y%m%d%H%M%S')
    create_file "db/one_off/#{timestamp}_#{file_name}.rb", <<~FILE
      require 'one_off/environments'

      module OneOff
        class #{class_name}
          include Environments

          environments :development, :production

          def perform
          end
        end
      end
    FILE
  end
end
