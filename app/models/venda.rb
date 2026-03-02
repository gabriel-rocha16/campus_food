class Venda < ApplicationRecord
  belongs_to :cliente
  belongs_to :funcionario
  has_many :itens_venda, class_name: "ItemVenda", dependent: :destroy

  accepts_nested_attributes_for :itens_venda, allow_destroy: true, reject_if: :all_blank

  validates :itens_venda, presence: true
end
