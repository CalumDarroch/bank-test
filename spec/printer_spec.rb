require 'printer'

describe Printer do

  describe '#initialize' do
    it 'initializes with an account as an attribute' do
      expect(subject.account).to be_instance_of(Account)
    end
  end

  describe '#print_statement' do
    it 'should print a header line and a line for each transaction' do
      subject.account.deposit(500)
      subject.account.withdraw(200)
      expect(STDOUT).to receive(:puts).exactly(3).times
      subject.print_statement
    end
  end

end
