class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :capacity
      t.date :checkin
      t.date :checkout
      t.boolean :confirmation

      t.timestamps
    end
  end
end
