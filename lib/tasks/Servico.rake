require 'csv'
 
namespace :tarefas do
 
  desc "Importa arquivo CSV, Parametro: PATH=caminho do arquivo"
 
  task :importar_servico => :environment do
    filename = File.join Rails.root, 'Servicos.csv'
   
    puts "Verificando a existência do arquivo " + filename + "..."
 
    unless File::exists?(filename)
      puts "Arquivo nao encontrado, verifique se esta correto e tente novamente."
      return
    end
 
    puts "Arquivo encontrado!"
    puts "Executando importacao, aguarde..."
 
    CSV.foreach(filename, :col_sep => ";") do |linha|
#    CSV.foreach("#{filename}","r") do |linha|
      item       = linha[0]
      codSeinfra = linha[1]
      descricao  = linha[2]
      sigla      = linha[3]
      valor      = linha[4]
      servico =  Servico.find_by_item(item)
  
      #Recuperando unidade da sigla informada
      puts sigla
      unidade = Unidade.find_by_sigla(sigla)
      puts unidade.id
      
      #Recuperando tipo de serviço pelo item informado
      itemPai = item.split('.')[0] + '.' + item.split('.')[1]
      father =  TipoServico.find_by_item(itemPai)

      if servico == nil
        puts "Inserindo linha"
        servico = Servico.new(
          :descricao       => descricao, 
          :item            => item,
          :codigo_seinfra  => codSeinfra,
          :unidade_id      => unidade.id,
          :tipo_servico_id => father.id,
          :vl_unidade      => valor
        )        

      else
        puts "Atualizando Serviço "
        servico.descricao      = descricao
        servico.item           = item
        servico.codigo_seinfra = codSeinfra
        servico.unidade        = unidade
        servico.tipo_servico   = father
        servico.vl_unidade     = valor
      end
      servico.save
    end
    puts "Importação do Serviço concluida com sucesso!"
  end
end