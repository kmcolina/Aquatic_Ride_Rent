class AddCoordinatesToObjetoAcuatico < ActiveRecord::Migration[6.1]
  def change
    add_column :objeto_acuaticos, :latitude, :float
    add_column :objeto_acuaticos, :longitude, :float
  end
end
