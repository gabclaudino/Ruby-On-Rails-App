class Pessoa < ApplicationRecord
  has_one  :documento,     dependent: :destroy
  has_many :enderecos,     dependent: :destroy
  has_many :participacoes,
           class_name: 'Participacao',
           dependent: :destroy
  has_many :projetos,
           through: :participacoes
  accepts_nested_attributes_for :documento, update_only: true
  accepts_nested_attributes_for :enderecos, allow_destroy: true
end
