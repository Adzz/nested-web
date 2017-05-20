RSpec.describe DataImporter do
  subject { described_class.new('spec/fixture/test.csv') }

  it 'imports csv data into the db' do
    subject.import_data
    expect(HousePriceIndex.all.count).to eq 25
  end

  it 'validates the data source' do
    expect { described_class.new('not/a/file') }.to raise_error ArgumentError, "please provide correct file"
  end
end
