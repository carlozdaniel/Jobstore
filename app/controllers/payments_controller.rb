class PaymentsController < ApplicationController
  require 'paypal-sdk-rest'
  include PayPal::SDK::REST
  
  def create
  # Build Payment object
    payment = Payment.new({
      intent: "sale",
      payer: {
        payment_method: "paypal" 
      },
      transactions: [
        {
          item_list: {
          items: [{name: "Demo", sku: :item, price: (@shopping_cart.total / 100), currency: "USD", quantity:1}]
          },
          amount: { 
            total: (@shopping_cart.total / 100),
            currency: "USD"
          },
          description: "Compra de tus productos en nuestra plataforma"
        }
      ],
      redirect_urls:{ 
        return_url: "http://localhost:3000",
        cancel_url: "http://localhost:3000/carrito"
      }
    })
    if payment.create
      redirect_to payment.links.find{|v| v.method == "REDIRECT" }.href
      
      #@payment = MyPayment.create!(paypal_id: payment.id,
       #                           ip:request.remote_ip,
       #                           shopping_cart_id:cookies[:shopping_cart_id]) 
      #redirect_to payment.links.find{|v| v.method == "REDIRECT" }.href
    else
      raise payment.error.to_yaml
    end
  end
end
