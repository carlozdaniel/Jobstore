class EmailController < ApplicationController
  def create
    @email = MyEmail.new(email: params[:email])
    if @email.save
      render json: @email
    else
      render json: @email.error, status: :unprocessable_entity
    end
  end
end
