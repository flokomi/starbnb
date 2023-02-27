class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :status
      t.integer :price
      t.integer :total_guests

      t.timestamps
    end
  end
end
