class Venda < ApplicationRecord
  belongs_to :cliente
  belongs_to :funcionario
  has_many :itens_venda, class_name: "ItemVenda", dependent: :destroy

  accepts_nested_attributes_for :itens_venda, allow_destroy: true, reject_if: :all_blank

  validates :itens_venda, presence: true

  before_save :calcular_total

  def recalcular_total
    calcular_total
    save
  end

  private

  def calcular_total
    self.total = itens_venda.sum do |item|
      quantidade = item.quantidade || 0
      preco = item.preco_unitario.presence || item.produto&.preco || 0
      quantidade * preco
    end
  end
end
