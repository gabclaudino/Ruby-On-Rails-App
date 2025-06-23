class CreateProjetos < ActiveRecord::Migration[7.2]
  def change
    create_table :projetos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
