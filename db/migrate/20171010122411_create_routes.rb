class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.integer :number
      
      t.timestamps
    end
  end
end
