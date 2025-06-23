class ProjetosController < ApplicationController
  before_action :authenticate_user!                               # exige login em todas as ações
  before_action :set_projeto, only: %i[ show edit update destroy ]
  after_action  :verify_authorized, except: %i[ index show ]      # exige authorize em create/new/edit/update/destroy

  def index
    @projetos = policy_scope(Projeto)
  end

  def show
    authorize @projeto
  end

  def new
    @projeto = Projeto.new
    authorize @projeto
  end

  def create
    @projeto = Projeto.new(projeto_params)
    authorize @projeto
    if @projeto.save
      redirect_to @projeto, notice: "Projeto criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @projeto
  end

  def update
    authorize @projeto
    if @projeto.update(projeto_params)
      redirect_to @projeto, notice: "Projeto atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @projeto
    @projeto.destroy
    redirect_to projetos_path, notice: "Projeto excluído."
  end

  private

  def set_projeto
    @projeto = Projeto.find(params[:id])
  end

  def projeto_params
    params.require(:projeto).permit(:nome, pessoa_ids: [])
  end
end
