class OrdensController < ApplicationController
  before_action :authenticate_user!

  before_action :set_orden, only: [:show, :edit, :update, :destroy]

  layout "admin", except: [:carrito, :confirmar] 
  # GET /ordens
  # GET /ordens.json
  def index
    @ordens = Orden.all
  end

  def confirmar
    #Buscamos al cliente asociado al usuario
    cliente = Cliente.where(user_id: current_user.id).first
    if cliente.blank?
      #En caso de no existir, lo creamos
      cliente = Cliente.new
      cliente.nombres = "---"
      cliente.apell_pat = "---"
      cliente.apell_mat = "---"
      cliente.nif = "---"
      cliente.save
    end
    #Buscar la ultima orden del cliente encontrado
    # Ejemplo: Sus ordenes son: 50, 60, 70, 80, 90
    # Orden descendente => 90, 80, 70, 60, 50
    ord = Orden.where(cliente_id: cliente.id)
      .order("id desc")
      .first
      
    if ord.blank?
      ord = Orden.new
      ord.cliente_id = cliente.id
      # Cuenta de ordenes es: 45 => 0045
      ord.codigo = "#{Orden.all.count + 1}".rjust(4, "0")
      ord.proceso = "2016-10-30"
      ord.entrega = "2016-10-30"
      ord.cierre = "2016-10-30"
      ord.save()
    end
    @orden = ord
  end
  
  def carrito
    @qty = params[:cantidad]
    @producto_id = params[:producto_id]

    #Buscamos al cliente asociado al usuario
    cliente = Cliente.where(user_id: current_user.id).first
    if cliente.blank?
      #En caso de no existir, lo creamos
      cliente = Cliente.new
      cliente.nombres = "---"
      cliente.apell_pat = "---"
      cliente.apell_mat = "---"
      cliente.nif = "---"
      cliente.save
    end
    #Buscar la ultima orden del cliente encontrado
    # Ejemplo: Sus ordenes son: 50, 60, 70, 80, 90
    # Orden descendente => 90, 80, 70, 60, 50
    ord = Orden.where(cliente_id: cliente.id)
      .order("id desc")
      .first
      
    if ord.blank?
      ord = Orden.new
      ord.cliente_id = cliente.id
      # Cuenta de ordenes es: 45 => 0045
      ord.codigo = "#{Orden.all.count + 1}".rjust(4, "0")
      ord.proceso = "2016-10-30"
      ord.entrega = "2016-10-30"
      ord.cierre = "2016-10-30"
      ord.save()
    end
    @orden = ord
    if @qty.blank? or @producto_id.blank?
      render 
      return
    end

    @producto_obj = Producto.find(@producto_id)
    
    
    #Asocia la orden con el producto, pero primero la busca
    oprod = OrdenProducto
      .where(orden_id: ord.id, 
        producto_id: @producto_id).first

    if oprod.blank?
      #Si no existe la asociacion Producto vs Orden, lo crea
      oprod = OrdenProducto.new
      oprod.producto_id = @producto_id
      oprod.orden_id = ord.id
      oprod.cantidad = @qty
      oprod.precio = @producto_obj.precio
      oprod.instrucciones = "---"
      oprod.descuento = 0
      oprod.save
    else
      #si la relacion Producto vs Orden ya existe,
      #puedo actualizar el precio y cantidad.
      oprod.precio = @producto_obj.precio
      oprod.cantidad = @qty
      oprod.save
    end
    @orden = ord
  end
  # GET /ordens/1
  # GET /ordens/1.json
  def show
  end

  # GET /ordens/new
  def new
    @orden = Orden.new
  end

  # GET /ordens/1/edit
  def edit
  end

  # POST /ordens
  # POST /ordens.json
  def create
    @orden = Orden.new(orden_params)

    respond_to do |format|
      if @orden.save
        format.html { redirect_to @orden, notice: 'Orden was successfully created.' }
        format.json { render :show, status: :created, location: @orden }
      else
        format.html { render :new }
        format.json { render json: @orden.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordens/1
  # PATCH/PUT /ordens/1.json
  def update
    respond_to do |format|
      if @orden.update(orden_params)
        format.html { redirect_to @orden, notice: 'Orden was successfully updated.' }
        format.json { render :show, status: :ok, location: @orden }
      else
        format.html { render :edit }
        format.json { render json: @orden.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordens/1
  # DELETE /ordens/1.json
  def destroy
    @orden.destroy
    respond_to do |format|
      format.html { redirect_to ordens_url, notice: 'Orden was successfully destroyed.' }
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
