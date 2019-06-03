require_relative 'account'

class Printer

  attr_reader :account

  def initialize
    @account = Account.new
  end

end
