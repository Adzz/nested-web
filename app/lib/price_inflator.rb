class PriceInflator
  def calculate(price, borough, from_date, to_date)
    (price * (index_for(borough, from_date) / index_for(borough, to_date))).to_f.round(2)
  end

  private

  def index_for(borough, date)
    data = HousePriceIndex.first(borough: borough, date: date)
    raise NoDataError.new(borough, date) unless data
    data.index
  end
end

class NoDataError < StandardError
  def initialize(borough, date)
    super("We dont have any data for #{borough} on #{date} :(")
  end
end
