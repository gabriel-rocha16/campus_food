class CreateItensVendas < ActiveRecord::Migration[8.1]
  def change
    create_table :itens_vendas do |t|
      t.decimal :quantidade
      t.decimal :preco_unitario

      t.timestamps
    end
  end
end
