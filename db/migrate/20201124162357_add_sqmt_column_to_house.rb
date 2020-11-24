class AddSqmtColumnToHouse < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :sqmt, :int
  end
end
