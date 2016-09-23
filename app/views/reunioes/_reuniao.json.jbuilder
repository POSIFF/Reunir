json.extract! reuniao, :id, :codigo, :descricao, :data, :hora, :local, :convidados, :imagem, :observacoes, :created_at, :updated_at
json.url reuniao_url(reuniao, format: :json)