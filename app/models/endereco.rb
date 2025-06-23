class Endereco < ApplicationRecord
  belongs_to :pessoa
  validates :logradouro, presence: true
  validates :cidade, presence: true
end