class AddReuniaoToPautas < ActiveRecord::Migration[5.0]
  def change
    add_reference :pautas, :pauta, foreign_key: true
  end
end
