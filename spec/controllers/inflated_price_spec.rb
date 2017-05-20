RSpec.describe 'Sinatra::Application' do
  before do
    HousePriceIndex.create(
      borough: 'Aberdeenshire',
      date: '01/03/2004',
      index: 83525.09702
    )
    HousePriceIndex.create(
      borough: 'Aberdeenshire',
      date: '01/01/2006',
      index: 111351.6113
    )
  end

  it '404s if we dont have data' do
    get 'inflated_price?price=2000&from_date=12/12/12&borough=London&to_date=12/12/13'
    expect(last_response.status).to be 404
  end

  it '400s if we dont provide the required params' do
    get '/inflated_price'
    expect(last_response.status).to be 400
  end

  it '200s and returns json containing correct price when we have the data' do
    get '/inflated_price?price=200000&from_date=01/03/2004&borough=Aberdeenshire&to_date=01/01/2006'
    expect(last_response.status).to eq 200
    expect(last_response.body).to eq "{\"inflated_price\":150020.46}"
  end

  def app
    Sinatra::Application
  end
end
