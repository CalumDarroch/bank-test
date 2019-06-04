require 'transaction'
require 'date'

describe Transaction do

  subject { described_class.new(Time.new(2007,04,10, 12,0,0, "+01:00"), 1000, 400) }

  describe '#initialize' do
    it 'initializes with a date in %d-%m-%Y format' do
      expect(subject.date).to eq('10-04-2007')
    end

    it 'initializes with an amount' do
      expect(subject.amount).to eq(1000)
    end

    it 'initializes with a balance' do
      expect(subject.balance).to eq(400)
    end
  end

end
