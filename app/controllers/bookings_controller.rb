class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    authorize @booking
    @objeto_acuatico = ObjetoAcuatico.find(params[:objeto_acuatico_id])
    @booking.objeto_acuatico = @objeto_acuatico
  end


  def create
    @objeto_acuatico = ObjetoAcuatico.find(params[:objeto_acuatico_id])
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user_id = current_user.id
    @booking.objeto_acuatico =  @objeto_acuatico
    if @booking.save
      redirect_to objeto_acuatico_path(@objeto_acuatico)
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:checkin, :checkout, :capacity, :objeto_acuatico_id)
  end


end
