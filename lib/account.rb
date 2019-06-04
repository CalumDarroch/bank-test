require_relative 'transaction'
require_relative 'printer'

class Account

  attr_reader :account_balance, :transactions, :printer

  def initialize
    @account_balance = 0
    @transactions = []
    @printer = Printer.new
  end

  def deposit(amount)
    if amount == 0
      fail 'Cannot deposit an amount of 0'
    else
      @account_balance += amount
      deposit = Transaction.new(Time.now, amount, @account_balance)
      @transactions << deposit
    end
  end

  def withdraw(amount)
    if amount == 0
      fail 'Cannot withdraw an amount of 0'
    else
      @account_balance -= amount
      withdrawal = Transaction.new(Time.now, -amount, @account_balance)
      @transactions << withdrawal
    end
  end

  def print_statement
    @printer.print(@transactions)
  end

end
