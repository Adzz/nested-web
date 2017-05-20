env = ENV["RACK_ENV"] || "development"
require "data_mapper"
require "dm-sqlite-adapter"
require "dm-validations"

require_relative '../models/house_price_index.rb'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/app/db/development.db")
DataMapper.finalize
