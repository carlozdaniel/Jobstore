class Stores::Paypal
  include PayPal::SDK::REST
  attr_accessor :payment, :shopping_cart
  def initialize(options)
    self.shopping_cart = options[:shopping_cart]
  end

  def process_payment
    self.payment = Payment.new({
      intent: "sale",
      payer: {
        payment_method: "paypal"
      },
      transactions: [
        {
          item_list: {
          items: [{name: "Demo", sku: :item, price: (self.shopping_cart.total / 100), currency: "USD", quantity:1}]
          },
          amount: {
            total: (self.shopping_cart.total / 100),
            currency: "USD"
          },
          description: "Compra de tus productos en nuestra plataforma"
        }
      ],
      redirect_urls:{
        return_url: "http://localhost:3000/checkout",
        cancel_url: "http://localhost:3000/carrito"
      }
    })
    self.payment
  end
end