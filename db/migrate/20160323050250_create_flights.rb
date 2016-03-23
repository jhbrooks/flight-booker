class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.datetime :start
      t.time :duration
      t.references :from, index: true
      t.references :to, index: true

      t.timestamps null: false
    end

    add_foreign_key :flights, :airports, column: :from_id
    add_foreign_key :flights, :airports, column: :to_id
  end
end
