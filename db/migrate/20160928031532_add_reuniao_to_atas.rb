class AddReuniaoToAtas < ActiveRecord::Migration[5.0]
  def change
    add_reference :atas, :reuniao, foreign_key: true
  end
end
