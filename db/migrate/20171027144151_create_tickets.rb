class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.belongs_to :user, index: true
      t.belongs_to :train
      t.string :first_name
      t.string :last_name
      t.integer :passport_number
      t.integer :first_station_id
      t.integer :last_station_id
    end
  end
end
