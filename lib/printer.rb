require_relative 'account'

class Printer

  attr_reader :account

  def initialize
    @account = Account.new
  end

  def print_statement
    puts 'date || credit || debit || balance'
    @account.transactions.reverse.each do |transaction|
      if transaction.amount.positive?
        puts "#{transaction.date} || #{transaction.amount} || || #{account.balance}"
      elsif transaction.amount.negative?
        puts "#{transaction.date} || || #{transaction.amount.abs} || #{account.balance}"
      else
        puts "#{transaction.date} || || || #{account.balance}"
      end
    end
  end  

end
