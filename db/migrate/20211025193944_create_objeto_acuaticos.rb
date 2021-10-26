class CreateObjetoAcuaticos < ActiveRecord::Migration[6.1]
  def change
    create_table :objeto_acuaticos do |t|
      t.string :title
      t.text :description
      t.string :location
      t.float :price
      t.integer :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
