class Participacao < ApplicationRecord
  self.table_name = "participacoes"
  belongs_to :pessoa
  belongs_to :projeto
end