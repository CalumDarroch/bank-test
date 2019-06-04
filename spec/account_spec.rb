require 'account'

describe Account do

  describe '#initialize' do
    it 'initializes with a balance of zero' do
      expect(subject.account_balance).to eq(0)
    end

    it 'initializes with an empty list of transactions' do
      expect(subject.transactions).to be_instance_of(Array)
      expect(subject.transactions).to be_empty
    end

    it 'initializes with a Printer object' do
      expect(subject.printer).to be_instance_of(Printer)
    end
  end

  describe '#deposit' do
    it 'creates a new transaction' do
      subject.deposit(500)
      expect(subject.transactions[0]).to be_instance_of(Transaction)
    end

    it 'increases the account balance' do
      subject.deposit(500)
      expect(subject.account_balance).to eq(500)
    end

    it 'will return an error if you try to deposit 0' do
      expect { subject.deposit(0) }.to raise_error('Cannot deposit an amount of 0')
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
      expect(subject.account_balance).to eq(4500)
    end

    it 'will return an error if you try to withdraw 0' do
      expect { subject.withdraw(0) }.to raise_error('Cannot withdraw an amount of 0')
    end
  end

  describe '#print_statement' do
    it 'instructs the printer object to print transactions to the console' do
      expect(subject.printer).to receive(:print).with([])
      subject.print_statement
    end
  end

end
