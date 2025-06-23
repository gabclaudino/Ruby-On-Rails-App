class PessoasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pessoa, only: %i[ show edit update destroy ]
  after_action  :verify_authorized, except: %i[index]

  def index
    @pessoas = policy_scope(Pessoa)
  end

  def show
    authorize @pessoa
  end

  def create
    @pessoa = Pessoa.new(pessoa_params)
    authorize @pessoa
    if @pessoa.save
      redirect_to @pessoa, notice: "Pessoa criada."
    else
      render :new
    end
  end

  def update

    authorize @pessoa

    if @pessoa.update(pessoa_params)
      redirect_to @pessoa, notice: "Pessoa atualizada com sucesso."
    else
      puts @pessoa.errors.full_messages # <--- ADICIONE ISSO TEMPORARIAMENTE
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    authorize @pessoa
    @pessoa.destroy
    redirect_to pessoas_url, notice: "Pessoa excluída."
  end

  # app/controllers/pessoas_controller.rb
  def new
    @pessoa = Pessoa.new
    @pessoa.build_documento
    @pessoa.enderecos.build
    authorize @pessoa 
  end

  def edit
    @pessoa = Pessoa.find(params[:id])
    @pessoa.build_documento unless @pessoa.documento
    @pessoa.enderecos.build if @pessoa.enderecos.empty?
  
    authorize @pessoa
  end


  private

  def set_pessoa
    @pessoa = Pessoa.find(params[:id])
  end

  def pessoa_params
    params.require(:pessoa).permit(
      :nome,
      :sobrenome,
      documento_attributes: [:id, :numero],
      enderecos_attributes: [:id, :logradouro, :cidade, :_destroy],
      projeto_ids: []
    )
  end
end
