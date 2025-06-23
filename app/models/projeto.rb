class Projeto < ApplicationRecord
  has_many :participacoes,
           class_name: 'Participacao',
           dependent: :destroy
  has_many :pessoas,
           through: :participacoes
end
