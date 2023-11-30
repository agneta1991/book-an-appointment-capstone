class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.time :time
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
