class ComposicaosController < ApplicationController
  before_action :authorize
  def new
  	@composicao = Composicao.new
  end

  def index
    @servicos = Servico.all
    @composicaos = Composicao.all
  end
end
