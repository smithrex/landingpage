class OrdensController < ApplicationController
  before_action :set_orden, only: %i[ show edit update destroy ]

  layout "admin", except: [:carrito]
  # GET /ordens or /ordens.json
  def index
    @ordens = Orden.all
  end

  def carrito
    @qty = params[:cantidad]
    @producto_id = params[:producto_id]

    cliente = Cliente.all.first
    if cliente.blank?
      cliente = Cliente.new
      clientes.nombres = "Rod"
      cliente.apell_pat = "Herrera"
      clientes.apell_mat = "Pizarro"
      cliente.nif = "000000"
      cliente.save
    end

    ord = Orden.all.first
    if ord.blank?
      ord = Orden.new
      ord.cliente_id = cliente.id
      ord.codigo = "20211001"
      ord.proceso = "2016-10-30"
      ord.entrega = "2016-10-30"
      ord.cierre = "2016-10-30"
      ord.save()
    end

    oprod = OrdenProducto
      .where(orden_id: ord.id,
        producto_id: @producto_id).first
    
    if oprod.blank?
      oprod = OrdenProducto.new
      oprod.producto_id = @producto_id
      oprod.orden_id = ord.id
      oprod.cantidad = @qty
      oprod.instrucciones = "---"
      oprod.descuento = 0
      oprod.save
    end
  
  end
  # GET /ordens/1 or /ordens/1.json
  def show
  end

  # GET /ordens/new
  def new
    @orden = Orden.new
  end

  # GET /ordens/1/edit
  def edit
  end

  # POST /ordens or /ordens.json
  def create
    @orden = Orden.new(orden_params)

    respond_to do |format|
      if @orden.save
        format.html { redirect_to @orden, notice: "Orden was successfully created." }
        format.json { render :show, status: :created, location: @orden }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @orden.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordens/1 or /ordens/1.json
  def update
    respond_to do |format|
      if @orden.update(orden_params)
        format.html { redirect_to @orden, notice: "Orden was successfully updated." }
        format.json { render :show, status: :ok, location: @orden }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @orden.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordens/1 or /ordens/1.json
  def destroy
    @orden.destroy
    respond_to do |format|
      format.html { redirect_to ordens_url, notice: "Orden was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden
      @orden = Orden.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def orden_params
      params.require(:orden).permit(:cliente_id, :codigo, :proceso, :entrega, :cierre)
    end
end
