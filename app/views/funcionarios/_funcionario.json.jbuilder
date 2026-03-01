json.extract! funcionario, :id, :nome, :cargo, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
