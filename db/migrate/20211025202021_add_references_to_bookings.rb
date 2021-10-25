class AddReferencesToBookings < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :user, foreign_key: true
    add_reference :bookings, :objeto_acuatico, foreign_key: true
  end
end
