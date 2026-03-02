class ItemVenda < ApplicationRecord
  self.table_name = "itens_vendas"

  belongs_to :venda
  belongs_to :produto
end
