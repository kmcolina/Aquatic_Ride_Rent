class ObjetoAcuaticosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_objeto_acuatico, only: [:show, :edit, :update, :destroy]

  def index
    @objeto_acuaticos = policy_scope(ObjetoAcuatico).order(created_at: :desc)
    if params[:query].present?
      @objeto_acuaticos = ObjetoAcuatico.search_by_title_and_location(params[:query])
    end
  end
  def show
    authorize @objeto_acuatico
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    #@objeto_acuaticoss = ObjetoAcuatico.all
    #@markers = @objeto_acuaticoss.geocoded.map do |flat|
    #  {
    #    lat: flat.latitude,
    #    lng: flat.longitude
    #  }
    #end
  end

  def create
    @objeto_acuatico = ObjetoAcuatico.new(objeto_acuatico_params)
    authorize @objeto_acuatico
    @objeto_acuatico.user = current_user
    if @objeto_acuatico.save
      redirect_to objeto_acuatico_path(@objeto_acuatico)
    else
      render :new
    end
  end



  def new
    @objeto_acuatico = ObjetoAcuatico.new
    authorize @objeto_acuatico
  end

  def edit
    authorize @objeto_acuatico
  end

  def update
    authorize @objeto_acuatico
    @objeto_acuatico.update(objeto_acuatico_params)
    redirect_to objeto_acuatico_path(@objeto_acuatico)
  end

  def destroy
    authorize @objeto_acuatico
    @objeto_acuatico.destroy
    redirect_to objeto_acuaticos_path
  end

    private

   def set_objeto_acuatico
     @objeto_acuatico = ObjetoAcuatico.find(params[:id])
   end

  def objeto_acuatico_params
    params.require(:objeto_acuatico).permit(:title, :description, :location, :price, :capacity, :users_id, :photo)
  end

end
