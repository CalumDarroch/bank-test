require_relative 'transaction'

class Account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    deposit = Transaction.new(amount)
    @transactions << deposit
  end

end
