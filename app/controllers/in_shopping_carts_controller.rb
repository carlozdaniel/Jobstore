class InShoppingCartsController < ApplicationController
  def create
    in_shopping_carts = InShoppingCart.new(product_id: params[:product_id], shopping_cart: @shopping_cart)
    if in_shopping_carts.save
      redirect_to carrito_path, notice: "Guardamos el producto"
    else
      redirect_to products_path(:id params[:product_id]), notice: "error al guardar"
    end
  end
  def destroy
    @in_shopping_carts = InShoppingCart.find(params[:id])
    @in_shopping_carts.destroy
    redirect_to carrito_path
  end
end
