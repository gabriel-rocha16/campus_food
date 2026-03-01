class CreateVendas < ActiveRecord::Migration[8.1]
  def change
    create_table :vendas do |t|
      t.datetime :data
      t.decimal :total
      t.references :cliente, null: false, foreign_key: true
      t.references :funcionario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
