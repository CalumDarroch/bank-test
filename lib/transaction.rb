require 'date'

class Transaction

  attr_reader :date, :amount, :balance

  def initialize(date, amount, account_balance)
    @date = date.strftime('%d-%m-%Y')
    @amount = amount
    @balance = account_balance
  end

end
