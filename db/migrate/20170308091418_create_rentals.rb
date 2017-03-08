class CreateRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :rentals do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.date :start_date
      t.date :due_date

      t.timestamps
    end
  end
end
