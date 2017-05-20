RSpec.describe HousePriceIndex do
  it 'requires a borough' do
    expect(HousePriceIndex.new(date: '1/1/1', index: 1).save).to eq false
  end

  it 'requires a date' do
    expect(HousePriceIndex.new(borough: 'London', index: 1).save).to eq false
  end

  it 'requires an index' do
    expect(HousePriceIndex.new(date: '1/1/1', borough: 'London').save).to eq false
  end

  it 'saves successfully' do
    expect(HousePriceIndex.new(date: '1/1/1', borough: 'London', index: 1).save).to eq true
  end
end
