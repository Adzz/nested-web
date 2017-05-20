require 'data_mapper'

namespace :db do
  desc "Destructive upgrade"
  task :auto_migrate do
    require './app/config/data_mapper_setup'
    DataMapper.auto_migrate!
    puts "Auto-migrate complete"
  end

  desc "Non destructive upgrade"
  task :upgrade do
    require './app/config/data_mapper_setup'
    DataMapper.auto_upgrade!
    puts 'Auto-upgrade complete'
  end

  desc "import data from csv"
  task :import_data, [:csv_path] do |_t, args|
    require_relative "./app/lib/data_importer.rb"
    DataImporter.new(args[:csv_path]).import_data
  end
end
