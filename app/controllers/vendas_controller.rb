class VendasController < ApplicationController
  before_action :set_venda, only: %i[ show edit update destroy ]

  # GET /vendas or /vendas.json
  def index
    @vendas = Venda.all
  end

  # GET /vendas/1 or /vendas/1.json
  def show
  end

  # GET /vendas/new
  def new
    @venda = Venda.new
    @venda.data = Time.now
  end

  def relatorio
    # Camada 1: O Devise já garante o login via before_action :authenticate_user!

    # Camada 2: Verificação de Hierarquia
    if current_user.gerente?
      @vendas = Venda.all
      @faturamento_total = Venda.sum(:total)
    else
      # Se um atendente tentar acessar pela URL, ele é expulso para a Home
      redirect_to root_path, alert: "Acesso Negado: Apenas gerentes podem ver relatórios financeiros."
    end
  end

  def edit
  end

  # POST /vendas or /vendas.json
  def create
    @venda = Venda.new(venda_params)

    respond_to do |format|
      if @venda.save
        format.html { redirect_to @venda, notice: "Venda was successfully created." }
        format.json { render :show, status: :created, location: @venda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendas/1 or /vendas/1.json
  def update
    respond_to do |format|
      if @venda.update(venda_params)
        format.html { redirect_to @venda, notice: "Venda was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @venda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendas/1 or /vendas/1.json
  def destroy
    @venda.destroy!

    respond_to do |format|
      format.html { redirect_to vendas_path, notice: "Venda was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venda
      @venda = Venda.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def venda_params
      params.expect(venda: [ :data, :total, :cliente_id, :funcionario_id ])
    end
end
