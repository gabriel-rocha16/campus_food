json.extract! itens_venda, :id, :quantidade, :preco_unitario, :created_at, :updated_at
json.url itens_venda_url(itens_venda, format: :json)
