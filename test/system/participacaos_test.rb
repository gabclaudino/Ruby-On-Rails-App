require "application_system_test_case"

class ParticipacaosTest < ApplicationSystemTestCase
  setup do
    @participacao = participacaos(:one)
  end

  test "visiting the index" do
    visit participacaos_url
    assert_selector "h1", text: "Participacaos"
  end

  test "should create participacao" do
    visit participacaos_url
    click_on "New participacao"

    fill_in "Pessoa", with: @participacao.pessoa_id
    fill_in "Projeto", with: @participacao.projeto_id
    click_on "Create Participacao"

    assert_text "Participacao was successfully created"
    click_on "Back"
  end

  test "should update Participacao" do
    visit participacao_url(@participacao)
    click_on "Edit this participacao", match: :first

    fill_in "Pessoa", with: @participacao.pessoa_id
    fill_in "Projeto", with: @participacao.projeto_id
    click_on "Update Participacao"

    assert_text "Participacao was successfully updated"
    click_on "Back"
  end

  test "should destroy Participacao" do
    visit participacao_url(@participacao)
    click_on "Destroy this participacao", match: :first

    assert_text "Participacao was successfully destroyed"
  end
end
