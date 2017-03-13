class UnidadesController < ApplicationController
  before_action :set_unidade, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  
  # GET /unidades
  # GET /unidades.json
  def index
    @unidades = Unidade.all
  end

  # GET /unidades/1
  # GET /unidades/1.json
  def show
  end

  # GET /unidades/new
  def new
    @unidade = Unidade.new
  end

  # GET /unidades/1/edit
  def edit
  end

  # POST /unidades
  # POST /unidades.json
  def create
    @unidade = Unidade.new(unidade_params)

    respond_to do |format|
      if @unidade.save
        format.html { redirect_to @unidade, notice: 'Unidade was successfully created.' }
        format.json { render :show, status: :created, location: @unidade }
      else
        format.html { render :new }
        format.json { render json: @unidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unidades/1
  # PATCH/PUT /unidades/1.json
  def update
    respond_to do |format|
      if @unidade.update(unidade_params)
        format.html { redirect_to @unidade, notice: 'Unidade was successfully updated.' }
        format.json { render :show, status: :ok, location: @unidade }
      else
        format.html { render :edit }
        format.json { render json: @unidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unidades/1
  # DELETE /unidades/1.json
  def destroy
    @unidade.destroy
    respond_to do |format|
      format.html { redirect_to unidades_url, notice: 'Unidade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidade
      @unidade = Unidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unidade_params
      params.require(:unidade).permit(:descricao, :sigla, :qtd_dimensao, :monetaria)
    end
end
