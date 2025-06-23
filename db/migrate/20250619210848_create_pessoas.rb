class CreatePessoas < ActiveRecord::Migration[7.2]
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :sobrenome

      t.timestamps
    end
  end
end
