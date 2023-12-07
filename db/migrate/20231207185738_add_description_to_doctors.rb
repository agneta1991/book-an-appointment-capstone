class AddDescriptionToDoctors < ActiveRecord::Migration[7.1]
  def change
    add_column :doctors, :description, :string
  end
end
