require 'printer'

describe Printer do

  describe '#initialize' do
    it 'initializes with an account as an attribute' do
      expect(subject.account).to be_instance_of(Account)
    end
  end

end
