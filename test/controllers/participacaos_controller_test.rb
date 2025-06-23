require "test_helper"

class ParticipacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participacao = participacaos(:one)
  end

  test "should get index" do
    get participacaos_url
    assert_response :success
  end

  test "should get new" do
    get new_participacao_url
    assert_response :success
  end

  test "should create participacao" do
    assert_difference("Participacao.count") do
      post participacaos_url, params: { participacao: { pessoa_id: @participacao.pessoa_id, projeto_id: @participacao.projeto_id } }
    end

    assert_redirected_to participacao_url(Participacao.last)
  end

  test "should show participacao" do
    get participacao_url(@participacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_participacao_url(@participacao)
    assert_response :success
  end

  test "should update participacao" do
    patch participacao_url(@participacao), params: { participacao: { pessoa_id: @participacao.pessoa_id, projeto_id: @participacao.projeto_id } }
    assert_redirected_to participacao_url(@participacao)
  end

  test "should destroy participacao" do
    assert_difference("Participacao.count", -1) do
      delete participacao_url(@participacao)
    end

    assert_redirected_to participacaos_url
  end
end
