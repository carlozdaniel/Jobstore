class AttachmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_owner!
  bafere_action :set_product
  def new

  end

  def create
    @attachment = Attachment.new(attachment_params)
    if @attachment.save
      redirect_to @attachment.product, notice: "se guardo el archivo adjusto"
    else
      redirect_to @product, notice: "no pudimos guardar el archivo"
    end
  end

  def destroy
  end 

  private
  def authenticate_owner!
    if params.has_key? attachment
      @product = Product.find(params[:attachment][:product_id])
      if @product.nil? || @product.user != current_user
        redirect_to root_path, notice: "No pudes editar este producto"
        return
      end
    end
  end

  def attachment_params
    params.require(:attachment).permit(:product_id, :archivo)
  end
end