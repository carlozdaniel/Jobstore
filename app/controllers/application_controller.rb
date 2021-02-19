class ApplicationController < ActionController::Base
  #en caso que de error la linea 3 eliminar 
  protect_from_forgery with: :exception
  before_action :set_shopping_cart
  private
  def set_shopping_cart
    if cookies[:shopping_cart_id].blank?
      @shopping_cart = ShoppingCart.create!(ip: request.remote_ip)
      cookies[:shopping_cart_id] = @shopping_cart.id

    else
      @shopping_cart = ShoppingCart.find(cookies[:shopping_cart_id])
    end
  rescue ActiveRecord::RecordNotFound => e
    @shopping_cart = ShoppingCart.create!(ip: request.remote_ip)
    cookies[:shopping_cart_id] = @shopping_cart.id
  end
end
 