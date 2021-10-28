class RemoveCapacityToBookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :capacity
  end
end
