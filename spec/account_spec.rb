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

  describe '#deposit' do
    it 'creates a new transaction' do
      subject.deposit(500)
      expect(subject.transactions[0]).to be_instance_of(Transaction)
    end

    it 'increases the account balance' do
      subject.deposit(500)
      expect(subject.balance).to eq(500)
    end
  end

  describe '#withdraw' do
    it 'creates a new transaction' do
      subject.withdraw(500)
      expect(subject.transactions[0]).to be_instance_of(Transaction)
    end

    it 'decreases the account balance' do
      subject.deposit(5000)
      subject.withdraw(500)
      expect(subject.balance).to eq(4500)
    end
  end

end
