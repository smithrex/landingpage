json.extract! producto, :id, :nombre, :categorium_id, :created_at, :updated_at
json.url producto_url(producto, format: :json)
