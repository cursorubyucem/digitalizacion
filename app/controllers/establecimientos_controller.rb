class EstablecimientosController < ApplicationController
  before_action :set_establecimiento, only: [:show, :edit, :update, :destroy]

  # GET /establecimientos
  # GET /establecimientos.json
  def index
    @establecimientos = Establecimiento.all
  end

  # GET /establecimientos/1
  # GET /establecimientos/1.json
  def show
    @foto = Foto.new
    @foto.establecimiento_id = @establecimiento.id    
    @documento = Documento.new
    @documento.establecimiento_id = @establecimiento.id
  end

  def guardar_foto
    begin
      @establecimiento = Establecimiento.find(params[:foto][:establecimiento_id])
      foto = Foto.create!(params.require(:foto).permit(:establecimiento_id, :foto))
      flash[:notice] = 'Foto creada correctamente'
      
    rescue Exception => e
      flash[:alert] = 'Error al guardar: ' << e.message
    ensure
      redirect_to @establecimiento
    end    
  end

  def borrar_foto
    foto = Foto.find(params[:id])
    @establecimiento = foto.establecimiento
    if foto.destroy
      flash[:notice] = 'Eliminado correctamente'
    else
      flash[:alert] = 'Error al eliminar'
    end
    redirect_to @establecimiento
  end


  def guardar_documento
    begin
      @establecimiento = Establecimiento.find(params[:documento][:establecimiento_id])
      documento = Documento.create!(params.require(:documento).permit(:establecimiento_id, :archivo))
      flash[:notice] = 'Documento creado correctamente'
      
    rescue Exception => e
      flash[:alert] = 'Error al guardar: ' << e.message
    ensure
      redirect_to @establecimiento
    end    
  end

  def borrar_documento
    documento = Documento.find(params[:id])
    @establecimiento = documento.establecimiento
    if documento.destroy
      flash[:notice] = 'Eliminado correctamente'
    else
      flash[:alert] = 'Error al eliminar'
    end
    redirect_to @establecimiento
  end

  def ver_documento
    documento = Documento.find(params[:id])
    file = File.new(documento.archivo.path)
    send_file file, disposition: 'inline', type: 'application/pdf'
  end



  # GET /establecimientos/new
  def new
    @establecimiento = Establecimiento.new
  end

  # GET /establecimientos/1/edit
  def edit
  end

  # POST /establecimientos
  # POST /establecimientos.json
  def create
    @establecimiento = Establecimiento.new(establecimiento_params)

    respond_to do |format|
      if @establecimiento.save
        format.html { redirect_to @establecimiento, notice: 'Establecimiento was successfully created.' }
        format.json { render :show, status: :created, location: @establecimiento }
      else
        format.html { render :new }
        format.json { render json: @establecimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /establecimientos/1
  # PATCH/PUT /establecimientos/1.json
  def update
    respond_to do |format|
      if @establecimiento.update(establecimiento_params)
        format.html { redirect_to @establecimiento, notice: 'Establecimiento was successfully updated.' }
        format.json { render :show, status: :ok, location: @establecimiento }
      else
        format.html { render :edit }
        format.json { render json: @establecimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /establecimientos/1
  # DELETE /establecimientos/1.json
  def destroy
    @establecimiento.destroy
    respond_to do |format|
      format.html { redirect_to establecimientos_url, notice: 'Establecimiento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_establecimiento
      @establecimiento = Establecimiento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def establecimiento_params
      params.require(:establecimiento).permit(:nombre)
    end
end
