require 'printer'

describe Printer do
  let(:deposit) { double('deposit', date: '10-04-2007', amount: 500, balance: 500) }
  let(:withdrawal) { double('withdrawal', date: '11-04-2007', amount: -200, balance: 300) }

  describe '#print' do
    let(:transactions) { [deposit, withdrawal] }

    it 'should print a header line and a line for each transaction' do
      expect(STDOUT).to receive(:puts).exactly(3).times
      subject.print(transactions)
    end

    it 'should print a properly formatted statement' do
      expect { subject.print(transactions) }.to output("date || credit || debit || balance\n11-04-2007 || || 200 || 300\n10-04-2007 || 500 || || 500\n").to_stdout
    end

  end

end
