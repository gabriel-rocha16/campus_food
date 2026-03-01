class Venda < ApplicationRecord
  belongs_to :cliente
  belongs_to :funcionario
end
