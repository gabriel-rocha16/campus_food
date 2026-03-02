class ItensVendasController < ApplicationController
  before_action :set_itens_venda, only: %i[ show edit update destroy ]

  # GET /itens_vendas or /itens_vendas.json
  def index
    @itens_vendas = ItensVenda.all
  end

  # GET /itens_vendas/1 or /itens_vendas/1.json
  def show
  end

  # GET /itens_vendas/new
  def new
    @itens_venda = ItensVenda.new
  end

  # GET /itens_vendas/1/edit
  def edit
  end

  # POST /itens_vendas or /itens_vendas.json
  def create
    @itens_venda = ItensVenda.new(itens_venda_params)

    respond_to do |format|
      if @itens_venda.save
        format.html { redirect_to @itens_venda, notice: "Itens venda was successfully created." }
        format.json { render :show, status: :created, location: @itens_venda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @itens_venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itens_vendas/1 or /itens_vendas/1.json
  def update
    respond_to do |format|
      if @itens_venda.update(itens_venda_params)
        format.html { redirect_to @itens_venda, notice: "Itens venda was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @itens_venda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @itens_venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itens_vendas/1 or /itens_vendas/1.json
  def destroy
    @itens_venda.destroy!

    respond_to do |format|
      format.html { redirect_to itens_vendas_path, notice: "Itens venda was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itens_venda
      @itens_venda = ItensVenda.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def itens_venda_params
      params.expect(itens_venda: [ :quantidade, :preco_unitario ])
    end
end
