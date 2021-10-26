class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @objeto_acuatico = ObjetoAcuatico.find(params[:objeto_acuatico_id])
    @booking.objeto_acuatico = @objeto_acuatico
  end

  def create
    @objeto_acuatico = ObjetoAcuatico.find(params[:objeto_acuatico_id])
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user
    @booking.objeto_acuatico = ObjetoAcuatico.find(params[:objeto_acuatico_id])
    if @booking.save
      redirect_to objeto_acuatico_path(@booking)
    else
      render :new
    end
  end
end
