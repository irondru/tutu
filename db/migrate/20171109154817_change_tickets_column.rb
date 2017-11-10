class ChangeTicketsColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :tickets, :passport_number, :string
  end
end
