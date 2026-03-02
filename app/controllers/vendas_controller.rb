class VendasController < ApplicationController
  before_action :set_venda, only: %i[ show edit update destroy ]

  # GET /vendas
  def index
    # Usamos .includes para carregar cliente e funcionário de uma vez, evitando lentidão (N+1)
    @vendas = Venda.includes(:cliente, :funcionario).all
  end

  # GET /vendas/1
  def show
    # Se quiser mostrar os itens na tela de Show, use: @venda.itens_venda.includes(:produto)
  end

  # GET /vendas/new
  def new
    @venda = Venda.new
    @venda.data = Time.now
    # Build cria a primeira linha vazia de produto para o formulário aparecer preenchido
    @venda.itens_venda.build
  end

  # GET /vendas/1/edit
  def edit
  end

  # POST /vendas
  def create
    @venda = Venda.new(venda_params)

    respond_to do |format|
      if @venda.save
        format.html { redirect_to @venda, notice: "Venda registrada com sucesso!" }
        format.json { render :show, status: :created, location: @venda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendas/1
  def update
    respond_to do |format|
      if @venda.update(venda_params)
        format.html { redirect_to @venda, notice: "Venda atualizada com sucesso.", status: :see_other }
        format.json { render :show, status: :ok, location: @venda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendas/1
  def destroy
    @venda.destroy!
    respond_to do |format|
      format.html { redirect_to vendas_path, notice: "Venda excluída com sucesso.", status: :see_other }
      format.json { head :no_content }
    end
  end

  def relatorio
    if current_user.gerente?
      @vendas = Venda.all
      @faturamento_total = Venda.sum(:total)
    else
      redirect_to root_path, alert: "Acesso Negado: Apenas gerentes podem ver relatórios financeiros."
    end
  end

  private

  def set_venda
    # Ajustado para usar params[:id] de forma padrão e segura
    @venda = Venda.find(params[:id])
  end

  def venda_params
    # Importante: itens_venda_attributes permite que os produtos sejam salvos junto com a venda
    params.require(:venda).permit(
      :data,
      :total,
      :cliente_id,
      :funcionario_id,
      itens_venda_attributes: [ :id, :produto_id, :quantidade, :preco_unitario, :_destroy ]
    )
  end
end
