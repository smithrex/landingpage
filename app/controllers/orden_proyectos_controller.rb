class OrdenProyectosController < ApplicationController
  before_action :set_orden_proyecto, only: %i[ show edit update destroy ]

  # GET /orden_proyectos or /orden_proyectos.json
  def index
    @orden_proyectos = OrdenProyecto.all
  end

  # GET /orden_proyectos/1 or /orden_proyectos/1.json
  def show
  end

  # GET /orden_proyectos/new
  def new
    @orden_proyecto = OrdenProyecto.new
  end

  # GET /orden_proyectos/1/edit
  def edit
  end

  # POST /orden_proyectos or /orden_proyectos.json
  def create
    @orden_proyecto = OrdenProyecto.new(orden_proyecto_params)

    respond_to do |format|
      if @orden_proyecto.save
        format.html { redirect_to @orden_proyecto, notice: "Orden proyecto was successfully created." }
        format.json { render :show, status: :created, location: @orden_proyecto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @orden_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orden_proyectos/1 or /orden_proyectos/1.json
  def update
    respond_to do |format|
      if @orden_proyecto.update(orden_proyecto_params)
        format.html { redirect_to @orden_proyecto, notice: "Orden proyecto was successfully updated." }
        format.json { render :show, status: :ok, location: @orden_proyecto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @orden_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orden_proyectos/1 or /orden_proyectos/1.json
  def destroy
    @orden_proyecto.destroy
    respond_to do |format|
      format.html { redirect_to orden_proyectos_url, notice: "Orden proyecto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden_proyecto
      @orden_proyecto = OrdenProyecto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def orden_proyecto_params
      params.require(:orden_proyecto).permit(:orden_id, :proyecto_id, :instrucciones)
    end
end
