class ServicosController < ApplicationController
  before_action :authorize
  before_action :set_servico, only: [:show, :edit, :update, :destroy]

  # GET /servicos
  # GET /servicos.json
  def index
    @unidade    = Unidade.all
    @tipo_servicos = TipoServico.all

    @filterrific = initialize_filterrific(
      Servico,
      params[:filterrific]
    ) or return

    @filterrific.select_options = {
      sorted_by: Servico.options_for_sorted_by,
      with_tipo_servico_id: TipoServico.options_for_select,
      with_unidade_id: Unidade.options_for_select
    }
    
    @servicos = @filterrific.find.page(params[:page]).per(20)
    
    respond_to do |format|
      format.html
      format.js
    end

  end

  # GET /servicos/1
  # GET /servicos/1.json
  def show
  end

  # GET /servicos/new
  def new
    @servico = Servico.new
  end

  # GET /servicos/1/edit
  def edit
  end

  # POST /servicos
  # POST /servicos.json
  def create
    @servico = Servico.new(servico_params)

    respond_to do |format|
      if @servico.save
        format.html { redirect_to @servico, notice: 'Servico criado com sucesso!' }
        format.json { render :show, status: :created, location: @servico }
      else
        format.html { render :new }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servicos/1
  # PATCH/PUT /servicos/1.json
  def update
    respond_to do |format|
      if @servico.update(servico_params)
        format.html { redirect_to @servico, notice: 'Serviço foi atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @servico }
      else
        format.html { render :edit }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servicos/1
  # DELETE /servicos/1.json
  def destroy
    @servico.destroy
    respond_to do |format|
      format.html { redirect_to servicos_url, notice: 'Servico removido com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servico
      @servico = Servico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def servico_params
      params.require(:servico).permit(:item, :descricao, :codigo_seinfra, :unidade_id, :tipo_servico_id, :especificacao, :vl_unidade)
    end
end
