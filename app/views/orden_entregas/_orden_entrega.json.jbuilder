json.extract! orden_entrega, :id, :orden_id, :fecha, :instrucciones, :direccion, :created_at, :updated_at
json.url orden_entrega_url(orden_entrega, format: :json)
