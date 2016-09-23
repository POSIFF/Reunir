require 'test_helper'

class ReunioesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reuniao = reunioes(:one)
  end

  test "should get index" do
    get reunioes_url
    assert_response :success
  end

  test "should get new" do
    get new_reuniao_url
    assert_response :success
  end

  test "should create reuniao" do
    assert_difference('Reuniao.count') do
      post reunioes_url, params: { reuniao: { codigo: @reuniao.codigo, convidados: @reuniao.convidados, data: @reuniao.data, descricao: @reuniao.descricao, hora: @reuniao.hora, imagem: @reuniao.imagem, local: @reuniao.local, observacoes: @reuniao.observacoes } }
    end

    assert_redirected_to reuniao_url(Reuniao.last)
  end

  test "should show reuniao" do
    get reuniao_url(@reuniao)
    assert_response :success
  end

  test "should get edit" do
    get edit_reuniao_url(@reuniao)
    assert_response :success
  end

  test "should update reuniao" do
    patch reuniao_url(@reuniao), params: { reuniao: { codigo: @reuniao.codigo, convidados: @reuniao.convidados, data: @reuniao.data, descricao: @reuniao.descricao, hora: @reuniao.hora, imagem: @reuniao.imagem, local: @reuniao.local, observacoes: @reuniao.observacoes } }
    assert_redirected_to reuniao_url(@reuniao)
  end

  test "should destroy reuniao" do
    assert_difference('Reuniao.count', -1) do
      delete reuniao_url(@reuniao)
    end

    assert_redirected_to reunioes_url
  end
end
