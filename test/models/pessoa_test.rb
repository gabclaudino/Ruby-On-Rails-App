require 'test_helper'

class PessoaTest < ActiveSupport::TestCase
  test "nome não pode ficar em branco" do
    pessoa = Pessoa.new(nome: "", sobrenome: "Silva")
    assert_not pessoa.valid?
    assert_includes pessoa.errors[:nome], "não pode ficar em branco"
  end
end