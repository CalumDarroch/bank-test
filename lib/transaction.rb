require 'date'

class Transaction

  attr_reader :date

  def initialize(amount)
    @date = Time.now.strftime('%d-%m-%Y')
    @amount = amount
  end

end
