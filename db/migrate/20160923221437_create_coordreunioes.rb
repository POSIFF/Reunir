class CreateCoordreunioes < ActiveRecord::Migration[5.0]
  def change
    create_table :coordreunioes do |t|
      t.integer :matricula
      t.string :nome
      t.string :funcao

      t.timestamps
    end
  end
end
