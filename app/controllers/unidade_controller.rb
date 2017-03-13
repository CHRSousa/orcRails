class UnidadeController < ApplicationController
	#GET /unidades
	def index
		@unidades = Unidade.all

		respond_to do |f|
			f.html
			f.json { render :json => @unidades}
		end
	end	

	#GET /unidades/1
	def show
		@unidade = Unidade.find(params[:id])

		respond_to do |f|
			f.json	{ render :json => @unidades}
		end
	end		

	#GET /unidades/new
	def new
		@unidade = Unidade.new

		respond_to do |f|
			f.html
		end
	end

	#POST /unidades
	def create
		@unidade = Unidade.create(unidade_params)

		respond_to do |f|
			f.html { redirect_to action: 'index'}
		end
	end

	#DELETE /unidades/1
	def destroy
		@unidades = Unidade.find(params[:codigo])
		@unidade.destroy

		respond_to do |f|
			f.html { redirect_to action: 'index'}
		end
	end

	private
		def unidade_params
			params.require(:unidade).permit(:codigo, :descricao, :qtd_dimensao, :monetaria)
	end
end
