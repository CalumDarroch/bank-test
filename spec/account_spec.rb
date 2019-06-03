require 'account'

describe Account do

  describe '#initialize' do
    it 'initializes with a balance of zero' do
      expect(subject.balance).to eq(0)
    end

    it 'initializes with an empty list of transactions' do
      expect(subject.transactions).to be_empty
    end
  end

end
