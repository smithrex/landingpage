json.extract! cliente, :id, :nombres, :apell_pat, :apell_mat, :nif, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
