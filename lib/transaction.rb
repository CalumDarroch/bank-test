require 'date'

class Transaction

  attr_reader :date, :amount, :balance

  def initialize(amount, account_balance)
    @date = Time.now.strftime('%d-%m-%Y')
    @amount = amount
    @balance = account_balance
  end

end
