class CreateAtas < ActiveRecord::Migration[5.0]
  def change
    create_table :atas do |t|
      t.string :codigo
      t.string :descricao
      t.string :autor

      t.timestamps
    end
  end
end
