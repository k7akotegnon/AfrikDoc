class RemoveSpecialtyFromDoctors < ActiveRecord::Migration[8.1]
  def change
    remove_column :doctors, :specialty, :string
  end
end
