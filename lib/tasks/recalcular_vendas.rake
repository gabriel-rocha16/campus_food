namespace :vendas do
  desc "Recalcula o total de todas as vendas baseado nos itens e preços dos produtos"
  task recalcular_totais: :environment do
    puts "Recalculando totais das vendas..."

    Venda.find_each do |venda|
      venda.recalcular_total
      puts "Venda ##{venda.id} - Total: R$ #{venda.total}"
    end

    puts "✓ Recalcule concluído!"
  end
end
