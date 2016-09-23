json.extract! gerencia, :id, :sigla, :descricao, :created_at, :updated_at
json.url gerencia_url(gerencia, format: :json)