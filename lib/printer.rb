require_relative 'account'

class Printer

  def print(transactions)
    puts 'date || credit || debit || balance'
    transactions.reverse.each do |transaction|
      if transaction.amount.positive?
        puts "#{transaction.date} || #{transaction.amount} || || #{transaction.balance}"
      elsif transaction.amount.negative?
        puts "#{transaction.date} || || #{transaction.amount.abs} || #{transaction.balance}"
      end
    end
  end

end
