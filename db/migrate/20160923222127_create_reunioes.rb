class CreateReunioes < ActiveRecord::Migration[5.0]
  def change
    create_table :reunioes do |t|
      t.string :codigo
      t.string :descricao
      t.date :data
      t.string :hora
      t.string :local
      t.string :convidados
      t.string :imagem
      t.string :observacoes

      t.timestamps
    end
  end
end
