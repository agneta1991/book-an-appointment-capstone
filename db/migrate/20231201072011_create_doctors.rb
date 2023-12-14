class CreateDoctors < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialization
      t.integer :years_of_experience
      t.decimal :price_per_appointment

      t.timestamps
    end
  end
end
