class AddColumnToTrains < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :carriage_order, :boolean
  end
end
