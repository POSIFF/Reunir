require 'test_helper'

class AtasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ata = atas(:one)
  end

  test "should get index" do
    get atas_url
    assert_response :success
  end

  test "should get new" do
    get new_ata_url
    assert_response :success
  end

  test "should create ata" do
    assert_difference('Ata.count') do
      post atas_url, params: { ata: { autor: @ata.autor, codigo: @ata.codigo, descricao: @ata.descricao } }
    end

    assert_redirected_to ata_url(Ata.last)
  end

  test "should show ata" do
    get ata_url(@ata)
    assert_response :success
  end

  test "should get edit" do
    get edit_ata_url(@ata)
    assert_response :success
  end

  test "should update ata" do
    patch ata_url(@ata), params: { ata: { autor: @ata.autor, codigo: @ata.codigo, descricao: @ata.descricao } }
    assert_redirected_to ata_url(@ata)
  end

  test "should destroy ata" do
    assert_difference('Ata.count', -1) do
      delete ata_url(@ata)
    end

    assert_redirected_to atas_url
  end
end
