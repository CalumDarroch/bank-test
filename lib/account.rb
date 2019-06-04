require_relative 'transaction'

class Account

  attr_reader :account_balance, :transactions

  def initialize
    @account_balance = 0
    @transactions = []
  end

  def deposit(amount)
    @account_balance += amount
    deposit = Transaction.new(amount, @account_balance)
    @transactions << deposit
  end

  def withdraw(amount)
    @account_balance -= amount
    withdrawal = Transaction.new(-amount, @account_balance)
    @transactions << withdrawal
  end

end
