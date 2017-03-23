class OrcamentosController < ApplicationController
	before_action :authorize
	before_action :set_orcamento, only: [:show, :edit, :update, :destroy, :linhas]
  
	def index
    	@orcamentos = Orcamento.all
    	#@linhas     = Linha.all
    	@obras 		  = Obra.all
      @servicos   = Servico.all
    
	    @filterrific = initialize_filterrific(
	      Orcamento,
	      params[:filterrific]
	    ) or return

	    @filterrific.select_options = {
	      sorted_by: Orcamento.options_for_sorted_by,
	      with_obra_id: Obra.options_for_select,
        with_servico_id: Servico.options_for_select
	    }
	    
	    @orcamentos = @filterrific.find.page(params[:page]).per(20)
	    
	    respond_to do |format|
	      format.html
	      format.js
	    end
	  end

  # GET /orcamentos/1
  # GET /orcamentos/1.json
  def show
  end

  # GET /orcamentos/new
  def new
    @orcamento = Orcamento.new
    @linha = @orcamento.linhas.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @orcamento }
      #format.js
    end
  end

  # GET /orcamentos/1/edit
  def edit
    #@unidade = Unidade.find(params[:unidade_id])
  end

  # POST /orcamentos
  # POST /orcamentos.json
  def create
    @orcamento = Orcamento.new(orcamento_params)

    respond_to do |format|
      if @orcamento.save
        format.html { redirect_to @orcamento, notice: 'Orcamento criado com sucesso!' }
        format.json { render :show, status: :created, location: @orcamento }
      else
        format.html { render :new }
        format.json { render json: @orcamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orcamentos/1
  # PATCH/PUT /orcamentos/1.json
  def update
    respond_to do |format|
      if @orcamento.update(orcamento_params)
        format.html { redirect_to @orcamento, notice: 'Orçamento atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @orcamento }
      else
        format.html { render :edit }
        format.json { render json: @orcamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orcamentos/1
  # DELETE /orcamentos/1.json
  def destroy
    @orcamento.destroy
    respond_to do |format|
      format.html { redirect_to orcamentos_url, notice: 'Orçamento apagado com sucesso!' }
      format.json { head :no_content }
    end
  end

  private

  def set_orcamento
      @orcamento = Orcamento.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def orcamento_params
    params.require(:orcamento).permit(:obra_id, 
                                      :nome_proprietario, 
                                      :cpf_proprietario, 
    	                                :bdi,
                                      :data, 
                                      linhas_attributes: [:id, :quantidade, :servico_id]
                                    )
  end
end
