# frozen_string_literal: true

namespace :one_off do
  task :run, [:async] => :environment do |_t, args|
    require 'one_off/migrator'
    args.with_defaults(async: !Rails.env.development?)
    OneOff::Migrator.run(async: args[:async])
  end

  task :matching, %i(search_string async) => [:environment] do |_t, args|
    require 'one_off/migrator'
    args.with_defaults(async: !Rails.env.development?)
    OneOff::Migrator.run files: OneOff::Migrator.matching(args.search_string), async: args[:async]
  end
end
