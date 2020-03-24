# frozen_string_literal: true

namespace :one_off do
  task run: :environment do
    OneOff::Migrator.run
  end

  task :matching, [:search_string] => [:environment] do |_t, args|
    OneOff::Migrator.run files: OneOff::Migrator.matching(args.search_string)
  end
end
