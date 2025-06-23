class CreateEnderecos < ActiveRecord::Migration[7.2]
  def change
    create_table :enderecos do |t|
      t.string :logradouro
      t.string :cidade
      t.references :pessoa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
