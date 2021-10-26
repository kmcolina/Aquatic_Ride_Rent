class ObjetoAcuaticosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_objeto_acuatico, only: [:show, :edit]

  def index
    @objeto_acuaticos = policy_scope(ObjetoAcuatico).order(created_at: :desc)
  end

  def show
    @objeto_acuatico = ObjetoAcuatico.find(params[:id])
    authorize @objeto_acuatico
  end

  def create
    @objeto_acuatico = ObjetoAcuatico.new(objeto_acuatico_params)
    authorize @objeto_acuatico
    if @objeto_acuatico.save
      redirect_to objeto_acuatico_path(@objeto_acuatico)
    else
      render :new
    end
  end

  def new
    @objeto_acuaticos = ObjetoAcuatico.new
    authorize @objeto_acuaticos
  end

    private

   def set_objeto_acuatico
     @objeto_acuatico = ObjetoAcuatico.find(params[:id])
   end

  def objeto_acuatico_params
    params.require(:objeto_acuatico).permit(:title, :description, :location, :price, :capacity, :users_id)
  end

end
