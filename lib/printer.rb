require_relative 'account'

class Printer

  def print(transactions)
    puts 'date || credit || debit || balance'
    transactions.reverse.each do |transaction|
      if transaction.amount.positive?
        puts "#{transaction.date} || #{'%.2f' % transaction.amount} || || #{'%.2f' % transaction.balance}"
      elsif transaction.amount.negative?
        puts "#{transaction.date} || || #{'%.2f' % transaction.amount.abs} || #{'%.2f' % transaction.balance}"
      end
    end
  end

end
