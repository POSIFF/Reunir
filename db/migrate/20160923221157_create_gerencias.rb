class CreateGerencias < ActiveRecord::Migration[5.0]
  def change
    create_table :gerencias do |t|
      t.string :sigla
      t.string :descricao

      t.timestamps
    end
  end
end
