class OrdenEntregasController < ApplicationController
  before_action :set_orden_entrega, only: %i[ show edit update destroy ]

  # GET /orden_entregas or /orden_entregas.json
  def index
    @orden_entregas = OrdenEntrega.all
  end

  # GET /orden_entregas/1 or /orden_entregas/1.json
  def show
  end

  # GET /orden_entregas/new
  def new
    @orden_entrega = OrdenEntrega.new
  end

  # GET /orden_entregas/1/edit
  def edit
  end

  # POST /orden_entregas or /orden_entregas.json
  def create
    @orden_entrega = OrdenEntrega.new(orden_entrega_params)

    respond_to do |format|
      if @orden_entrega.save
        format.html { redirect_to @orden_entrega, notice: "Orden entrega was successfully created." }
        format.json { render :show, status: :created, location: @orden_entrega }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @orden_entrega.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orden_entregas/1 or /orden_entregas/1.json
  def update
    respond_to do |format|
      if @orden_entrega.update(orden_entrega_params)
        format.html { redirect_to @orden_entrega, notice: "Orden entrega was successfully updated." }
        format.json { render :show, status: :ok, location: @orden_entrega }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @orden_entrega.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orden_entregas/1 or /orden_entregas/1.json
  def destroy
    @orden_entrega.destroy
    respond_to do |format|
      format.html { redirect_to orden_entregas_url, notice: "Orden entrega was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden_entrega
      @orden_entrega = OrdenEntrega.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def orden_entrega_params
      params.require(:orden_entrega).permit(:orden_id, :fecha, :instrucciones, :direccion)
    end
end
