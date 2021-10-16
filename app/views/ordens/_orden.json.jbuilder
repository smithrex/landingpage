json.extract! orden, :id, :cliente_id, :codigo, :proceso, :entrega, :cierre, :created_at, :updated_at
json.url orden_url(orden, format: :json)
