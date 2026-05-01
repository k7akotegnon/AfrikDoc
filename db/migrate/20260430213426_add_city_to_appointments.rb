class AddCityToAppointments < ActiveRecord::Migration[8.1]
  def change
    add_reference :appointments, :city, foreign_key: true
  end
end
