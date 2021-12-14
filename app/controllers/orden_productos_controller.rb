class OrdenProductosController < ApplicationController
  before_action :set_orden_producto, only: [:show, :edit, :update, :destroy ]

  # GET /orden_productos or /orden_productos.json
  def index
    @orden_productos = OrdenProducto.all
  end

  # GET /orden_productos/1 or /orden_productos/1.json
  def show
  end

  # GET /orden_productos/new
  def new
    @orden_producto = OrdenProducto.new
  end

  # GET /orden_productos/1/edit
  def edit
  end

  # POST /orden_productos or /orden_productos.json
  def create
    @orden_producto = OrdenProducto.new(orden_producto_params)

    respond_to do |format|
      if @orden_producto.save
        format.html { redirect_to @orden_producto, notice: "Orden producto was successfully created." }
        format.json { render :show, status: :created, location: @orden_producto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @orden_producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orden_productos/1 or /orden_productos/1.json
  def update
    respond_to do |format|
      if @orden_producto.update(orden_producto_params)
        format.html { redirect_to @orden_producto, notice: "Orden producto was successfully updated." }
        format.json { render :show, status: :ok, location: @orden_producto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @orden_producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orden_productos/1 or /orden_productos/1.json
  def destroy
    @orden_producto.destroy
    respond_to do |format|
      format.html { redirect_to orden_productos_url, notice: "Orden producto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def delete_item
  op = OrdenProducto.find(params[:id])
  op.destroy
  redirect_to "/ordens/carrito", flash: {notice: "Producto quitado del carrito."}
  end

  def update_cantidad
    op = OrdenProducto.find(params[:id])
    op.cantidad = params[:cantidad]
    if op.valid?
      op.save
     redirect_to "/ordens/carrito", flash: {notice: "Cantidad actualizada."}
    else
      redirect_to "/ordens/carrito", flash: 
      {alert: op.
      errors.full_messages.join("<br>")}
    end
    
    return
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden_producto
      @orden_producto = OrdenProducto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def orden_producto_params
      params.require(:orden_producto).permit(:orden_id, :producto_id, :cantidad, :precio, :instrucciones, :descuento)
    end
end
