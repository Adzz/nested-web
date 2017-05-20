require 'csv'
require_relative '../models/house_price_index.rb'

class DataImporter
  def initialize(csv_path)
    validate_csv_path(csv_path)
  end

# could implement a create_or_update method instead

  def import_data
    CSV.new(File.open(csv_path, 'r'), headers: true, converters: :all).lazy.each do |row|
      HousePriceIndex.create(
        borough: row['RegionName'],
        date: row['Date'],
        index: row['Index'].to_i
      )
    end
  end

  private

  attr_reader :csv_path

  def validate_csv_path(csv_path)
    raise ArgumentError, "please provide correct file" if csv_path.nil? || !File.exist?(csv_path)
    @csv_path = csv_path
  end
end
