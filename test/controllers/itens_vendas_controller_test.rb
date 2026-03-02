require "test_helper"

class ItensVendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @itens_venda = itens_vendas(:one)
  end

  test "should get index" do
    get itens_vendas_url
    assert_response :success
  end

  test "should get new" do
    get new_itens_venda_url
    assert_response :success
  end

  test "should create itens_venda" do
    assert_difference("ItensVenda.count") do
      post itens_vendas_url, params: { itens_venda: { preco_unitario: @itens_venda.preco_unitario, quantidade: @itens_venda.quantidade } }
    end

    assert_redirected_to itens_venda_url(ItensVenda.last)
  end

  test "should show itens_venda" do
    get itens_venda_url(@itens_venda)
    assert_response :success
  end

  test "should get edit" do
    get edit_itens_venda_url(@itens_venda)
    assert_response :success
  end

  test "should update itens_venda" do
    patch itens_venda_url(@itens_venda), params: { itens_venda: { preco_unitario: @itens_venda.preco_unitario, quantidade: @itens_venda.quantidade } }
    assert_redirected_to itens_venda_url(@itens_venda)
  end

  test "should destroy itens_venda" do
    assert_difference("ItensVenda.count", -1) do
      delete itens_venda_url(@itens_venda)
    end

    assert_redirected_to itens_vendas_url
  end
end
