json.extract! orden_producto, :id, :orden_id, :producto_id, :cantidad, :precio, :instrucciones, :descuento, :created_at, :updated_at
json.url orden_producto_url(orden_producto, format: :json)
