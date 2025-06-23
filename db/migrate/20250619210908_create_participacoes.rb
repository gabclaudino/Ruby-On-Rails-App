class CreateParticipacoes < ActiveRecord::Migration[7.2]
  def change
    create_table :participacoes do |t|
      t.references :pessoa, null: false, foreign_key: true
      t.references :projeto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
