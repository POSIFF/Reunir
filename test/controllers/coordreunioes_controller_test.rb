require 'test_helper'

class CoordreunioesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coordreuniao = coordreunioes(:one)
  end

  test "should get index" do
    get coordreunioes_url
    assert_response :success
  end

  test "should get new" do
    get new_coordreuniao_url
    assert_response :success
  end

  test "should create coordreuniao" do
    assert_difference('Coordreuniao.count') do
      post coordreunioes_url, params: { coordreuniao: { funcao: @coordreuniao.funcao, matricula: @coordreuniao.matricula, nome: @coordreuniao.nome } }
    end

    assert_redirected_to coordreuniao_url(Coordreuniao.last)
  end

  test "should show coordreuniao" do
    get coordreuniao_url(@coordreuniao)
    assert_response :success
  end

  test "should get edit" do
    get edit_coordreuniao_url(@coordreuniao)
    assert_response :success
  end

  test "should update coordreuniao" do
    patch coordreuniao_url(@coordreuniao), params: { coordreuniao: { funcao: @coordreuniao.funcao, matricula: @coordreuniao.matricula, nome: @coordreuniao.nome } }
    assert_redirected_to coordreuniao_url(@coordreuniao)
  end

  test "should destroy coordreuniao" do
    assert_difference('Coordreuniao.count', -1) do
      delete coordreuniao_url(@coordreuniao)
    end

    assert_redirected_to coordreunioes_url
  end
end
