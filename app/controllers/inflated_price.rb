require 'sinatra'
require 'json'
require 'pry'
require_relative '../lib/price_inflator'

get '/inflated_price' do
  content_type :json

  price = params[:price].to_i
  from_date = params[:from_date]
  borough = params[:borough]
  to_date = params[:to_date]

  halt 400, "Missing params" unless price && from_date && borough && to_date

  begin
    price = PriceInflator.new.calculate(price, borough, from_date, to_date)
  rescue StandardError => e
    halt 404, e.message
  end

  { inflated_price: price }.to_json
end
