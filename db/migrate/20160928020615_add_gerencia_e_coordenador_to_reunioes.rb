class AddGerenciaECoordenadorToReunioes < ActiveRecord::Migration[5.0]
  def change
    add_reference :reunioes, :gerencia, foreign_key: true
    add_reference :reunioes, :coordreuniao, foreign_key: true
  end
end
