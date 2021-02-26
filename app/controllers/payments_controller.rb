class PaymentsController < ApplicationController
  require 'paypal-sdk-rest'
  include PayPal::SDK::REST
  def checkout
    @my_payment = MyPayment.find_by(paypal_id: params[:paymentId])
    if @my_payment.nil?
      redirect_to "/carrito", notice:"Error"
    else
      payment = Payment.find(@my_payment.paypal_id)
      if payment.execute(payer_id: params[:PayerID])
        redirect_to carrito_path, notice:"se proceso el pago con paypal"
      else
        redirect_to carrito_path, notice:"Error al procesar el pago"
      end
    end
  end
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
        return_url: "http://localhost:3000/checkout",
        cancel_url: "http://localhost:3000/carrito"
      }
    })
    if payment.create
      #redirect_to payment.links.find{|v| v.method == "REDIRECT" }.href
      @my_payment = MyPayment.create!(paypal_id: payment.id,
                                  ip:request.remote_ip,
                                  shopping_cart_id:cookies[:shopping_cart_id]) 
      redirect_to payment.links.find{|v| v.method == "REDIRECT" }.href
    else
      raise payment.error.to_yaml
    end
  end
end
