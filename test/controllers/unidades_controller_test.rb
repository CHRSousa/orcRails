require 'test_helper'

class UnidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unidade = unidades(:one)
  end

  test "should get index" do
    get unidades_url
    assert_response :success
  end

  test "should get new" do
    get new_unidade_url
    assert_response :success
  end

  test "should create unidade" do
    assert_difference('Unidade.count') do
      post unidades_url, params: { unidade: { codigo: @unidade.codigo, descricao: @unidade.descricao, monetaria: @unidade.monetaria, qtd_dimensao: @unidade.qtd_dimensao, sigla: @unidade.sigla } }
    end

    assert_redirected_to unidade_url(Unidade.last)
  end

  test "should show unidade" do
    get unidade_url(@unidade)
    assert_response :success
  end

  test "should get edit" do
    get edit_unidade_url(@unidade)
    assert_response :success
  end

  test "should update unidade" do
    patch unidade_url(@unidade), params: { unidade: { codigo: @unidade.codigo, descricao: @unidade.descricao, monetaria: @unidade.monetaria, qtd_dimensao: @unidade.qtd_dimensao, sigla: @unidade.sigla } }
    assert_redirected_to unidade_url(@unidade)
  end

  test "should destroy unidade" do
    assert_difference('Unidade.count', -1) do
      delete unidade_url(@unidade)
    end

    assert_redirected_to unidades_url
  end
end
