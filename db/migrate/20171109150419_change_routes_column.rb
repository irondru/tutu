class ChangeRoutesColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :routes, :number, :string
  end
end
