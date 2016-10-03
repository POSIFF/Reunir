class AddFotoToCoordreunioes < ActiveRecord::Migration[5.0]
  def change
    add_column :coordreunioes, :foto, :string
  end
end
