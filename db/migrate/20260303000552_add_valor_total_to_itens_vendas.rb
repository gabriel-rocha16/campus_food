class AddValorTotalToItensVendas < ActiveRecord::Migration[8.1]
  def change
    add_column :itens_vendas, :valor_total, :decimal
  end
end
