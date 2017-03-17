json.extract! servico, :id, :item, :descricao, :codigo_seinfra, :unidade_id, :tipo_servico_id, :especificacao, :vl_unidade, :created_at, :updated_at
json.url servico_url(servico, format: :json)
