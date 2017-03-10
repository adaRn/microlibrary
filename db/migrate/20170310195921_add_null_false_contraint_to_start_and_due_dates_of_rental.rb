class AddNullFalseContraintToStartAndDueDatesOfRental < ActiveRecord::Migration[5.0]
  def change
    change_column_null :rentals, :start_date, false
    change_column_null :rentals, :due_date, false
  end
end
