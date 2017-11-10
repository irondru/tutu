class CreateCarriages < ActiveRecord::Migration[5.1]
  def change
    create_table :carriages do |t|
      t.belongs_to :train
      t.string :type
      t.integer :top_places
      t.integer :bottom_places
      t.integer :sedentary_places
      t.integer :side_bottom_places
      t.integer :side_top_places
    end
  end
end
