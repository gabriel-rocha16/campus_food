json.extract! venda, :id, :data, :total, :cliente_id, :funcionario_id, :created_at, :updated_at
json.url venda_url(venda, format: :json)
