class AddCityToPatients < ActiveRecord::Migration[8.1]
  def change
    add_reference :patients, :city, foreign_key: true
  end
end
