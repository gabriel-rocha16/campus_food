class Produto < ApplicationRecord
    # association with itens_venda; if a product is removed we clean up its
    # sale items so tests (and real data) don’t blow up with a foreign key
    # violation.
    # 'itens_venda' is not a Rails-friendly plural, so we must tell
    # ActiveRecord what class to use for the association.
    has_many :itens_venda, class_name: "ItemVenda", dependent: :destroy
end
