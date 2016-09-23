require 'test_helper'

class GerenciasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gerencia = gerencias(:one)
  end

  test "should get index" do
    get gerencias_url
    assert_response :success
  end

  test "should get new" do
    get new_gerencia_url
    assert_response :success
  end

  test "should create gerencia" do
    assert_difference('Gerencia.count') do
      post gerencias_url, params: { gerencia: { descricao: @gerencia.descricao, sigla: @gerencia.sigla } }
    end

    assert_redirected_to gerencia_url(Gerencia.last)
  end

  test "should show gerencia" do
    get gerencia_url(@gerencia)
    assert_response :success
  end

  test "should get edit" do
    get edit_gerencia_url(@gerencia)
    assert_response :success
  end

  test "should update gerencia" do
    patch gerencia_url(@gerencia), params: { gerencia: { descricao: @gerencia.descricao, sigla: @gerencia.sigla } }
    assert_redirected_to gerencia_url(@gerencia)
  end

  test "should destroy gerencia" do
    assert_difference('Gerencia.count', -1) do
      delete gerencia_url(@gerencia)
    end

    assert_redirected_to gerencias_url
  end
end
