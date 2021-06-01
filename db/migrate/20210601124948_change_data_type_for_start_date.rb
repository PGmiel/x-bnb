class ChangeDataTypeForStartDate < ActiveRecord::Migration[6.0]
  def change
      change_column :bookings, :start_date, "date USING start_date::date"
      change_column :bookings, :end_date, "date USING end_date::date"
  end
end
