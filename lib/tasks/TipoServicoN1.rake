require 'csv'
 
namespace :tarefas do
 
  desc "Importa arquivo CSV, Parametro: PATH=caminho do arquivo"
 
  task :importar_tipo_servico_n1 => :environment do
    filename = File.join Rails.root, 'TipoServico-Nivel1.csv'
   
    puts "Verificando a existência do arquivo " + filename + "..."
 
    unless File::exists?(filename)
      puts "Arquivo nao encontrado, verifique se esta correto e tente novamente."
      return
    end
 
    puts "Arquivo encontrado!"
    puts "Executando importacao, aguarde..."
 
    CSV.foreach(filename, :col_sep => ";") do |linha|
#    CSV.foreach("#{filename}","r") do |linha|
      item      = linha[0]
      descricao = linha[1]
      tipoServico =  TipoServico.find_by_item(item)
 
      if tipoServico == nil
        puts "Inserindo linha"
        tipoServico = TipoServico.new(:descricao => descricao, :item => item)        
      else
        puts "Atualizando TipoServico "
        tipoServico.descricao = descricao
      end
      tipoServico.save
    end
    puts "Importacao do Tipo de Serviço concluida com sucesso!"
  end
end