class Store::Paypal
  attr_accessor :payment
  paypal.payment
  def initialize(options)
    self.my_payment = options[:my_payments]
  end

  def process_payment

  end

end