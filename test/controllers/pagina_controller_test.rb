require 'test_helper'

class PaginaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pagina_index_url
    assert_response :success
  end

  test "should get reunir" do
    get pagina_reunir_url
    assert_response :success
  end

end
