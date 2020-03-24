# frozen_string_literal: true

namespace :one_off do
  task run: :environment do
    require 'one_off/migrator'
    OneOff::Migrator.run
  end

  task :matching, [:search_string] => [:environment] do |_t, args|
    require 'one_off/migrator'
    OneOff::Migrator.run files: OneOff::Migrator.matching(args.search_string)
  end
end
