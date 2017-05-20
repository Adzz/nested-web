require 'dm-validations'

class HousePriceIndex
  include DataMapper::Resource

  property :id, Serial
  property :borough, String, required: true
  property :date, DateTime, required: true
  property :index, Float, required: true
end
