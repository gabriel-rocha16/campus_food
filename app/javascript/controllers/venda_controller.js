import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["itemsContainer", "template", "total", "produtoSelect", "unitPrice", "quantidade", "valorTotal"]

  // Quando um produto é selecionado, buscar seu preço base
  updatePrice(event) {
    const produtoId = event.target.value
    if (!produtoId) return

    // Encontrar o campo de preço unitário mais próximo (do mesmo item)
    const itemRow = event.target.closest(".nested-fields")
    const unitPriceField = itemRow?.querySelector("[data-venda-target='unitPrice']")
    
    if (unitPriceField && produtoId) {
      // Buscar o preço do produto via API
      fetch(`/produtos/${produtoId}/preco.json`)
        .then(response => response.json())
        .then(data => {
          unitPriceField.value = parseFloat(data.preco).toFixed(2)
          this.calculateTotal({ target: unitPriceField })
        })
        .catch(error => console.error("Erro ao buscar preço:", error))
    }
  }

  // Calcular o valor total do item (quantidade * preco_unitario)
  calculateTotal(event) {
    const itemRow = event.target.closest(".nested-fields")
    if (!itemRow) return

    const quantidadeField = itemRow.querySelector("[data-venda-target='quantidade']")
    const unitPriceField = itemRow.querySelector("[data-venda-target='unitPrice']")
    const valorTotalField = itemRow.querySelector("[data-venda-target='valorTotal']")

    const quantidade = parseFloat(quantidadeField?.value) || 0
    const precoUnitario = parseFloat(unitPriceField?.value) || 0
    const valorTotal = quantidade * precoUnitario

    if (valorTotalField) {
      valorTotalField.value = isNaN(valorTotal) ? "0.00" : valorTotal.toFixed(2)
    }

    // Atualizar o total geral
    this.updateGrandTotal()
  }

  // Atualizar o total geral da venda
  updateGrandTotal() {
    const todasAsLinhas = this.element.querySelectorAll("[data-venda-target='valorTotal']")
    let totalGeral = 0

    todasAsLinhas.forEach(campo => {
      const valor = parseFloat(campo.value) || 0
      totalGeral += valor
    })

    const totalField = this.element.querySelector("[data-venda-target='total']")
    if (totalField) {
      totalField.value = isNaN(totalGeral) ? "0.00" : totalGeral.toFixed(2)
    }
  }

  // Adicionar novo item (dynamic nested forms)
  addItem(event) {
    event.preventDefault()

    const template = this.templateTarget
    const container = this.itemsContainerTarget
    
    // Gerar um novo índice único
    const newIndex = Date.now()
    const newHTML = template.innerHTML.replace(/NEW_ID/g, newIndex)
    
    // Criar um elemento temporário para inserir o HTML
    const div = document.createElement("div")
    div.innerHTML = newHTML
    
    // Inserir no container
    container.appendChild(div.firstElementChild)
    
    // Recalcular o total geral
    this.updateGrandTotal()
  }
}

