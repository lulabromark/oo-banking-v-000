class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    sender.valid? == true && receiver.valid? == true ? true : false
  end

  def execute_transaction
    if sender.valid? == false
      @amount = 'Transaction rejected. Please check your account balance.'
      @status = 'rejected'
    elsif status == 'pending'
      sender.balance -= amount
      receiver.balance += amount
      @status = 'complete'
    end
  end
end
