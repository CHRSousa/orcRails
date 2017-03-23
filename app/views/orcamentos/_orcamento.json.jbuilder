json.extract! orcamento, :id, :obra_id, :nome_proprietario, :cpf_proprietario, :bdi, :data, :created_at, :updated_at, 
                                      linhas_attributes: [:id, :quantidade, :servico_id]
json.url orcamento_url(orcamento, format: :json)
