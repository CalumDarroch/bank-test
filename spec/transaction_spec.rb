require 'transaction'
require 'date'

describe Transaction do

  subject { described_class.new(1000) }

  describe '#initialize' do
    it 'initializes with a date in %d-%m-%Y format' do
      allow(Time).to receive(:now).and_return Time.new(2007,04,10, 12,0,0, "+01:00")
      expect(subject.date).to eq('10-04-2007')
    end
  end

end