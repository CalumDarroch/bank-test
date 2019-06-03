require 'account'

describe Account do

  describe '#initialize' do
    it 'initializes with a balance of zero' do
      expect(subject.balance).to eq(0)
    end
  end

end
