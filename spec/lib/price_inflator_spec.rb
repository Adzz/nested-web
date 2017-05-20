require 'data_mapper'

RSpec.describe PriceInflator do
  subject { described_class.new }

  describe '#calculate' do
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

    it 'correctly calculates the price inflation rounded to 2 dps' do
      expect(subject.calculate(200_000, 'Aberdeenshire', '01/03/2004', '01/01/2006')).to eq 150020.46
    end
  end
end
