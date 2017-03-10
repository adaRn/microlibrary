class AddFinishDateToRentals < ActiveRecord::Migration[5.0]
  def change
    add_column :rentals, :finish_date, :date
  end
end
